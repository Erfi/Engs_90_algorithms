function feature_vector = mic_extractor (epoch, fs)

% Detection of Epileptic Seizures Through Audio Classification (Bruijne et al.)

% Make vectors 
mic = epoch; 
N = numel (epoch);
t = (1:numel(epoch))./fs;

% Filter out blips
for i = 1: N
	if abs(mic(i)) > 10
		mic(i) = 0;
	end
end

% Filter out powerlines
d1 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
               'DesignMethod','butter','SampleRate',fs);

d2 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',119,'HalfPowerFrequency2',121, ...
               'DesignMethod','butter','SampleRate',fs);
           
d3 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',179,'HalfPowerFrequency2',181, ...
               'DesignMethod','butter','SampleRate',fs);

d4 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',239,'HalfPowerFrequency2',241, ...
               'DesignMethod','butter','SampleRate',fs);

d5 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',299,'HalfPowerFrequency2',301, ...
               'DesignMethod','butter','SampleRate',fs);
           
mic = filtfilt(d1,mic);
mic = filtfilt(d2,mic);
mic = filtfilt(d3,mic);
mic = filtfilt(d4,mic);
mic = filtfilt(d5,mic);

% Calculate FT before and after filtering
[F1,f1] = fft_calc(epoch,fs);
[F2,f2] = fft_calc(mic,fs);

% Magnitude features
mic_mag = abs(mic);
mic_mag_avg = mean (mic_mag);
mic_mag_std = std (mic_mag);

% Pitch related to 
mic_autocorr = autocorr (mic);
pitch = mean (mic_autocorr); %use max instead? 

mic_spectral_centroid = dot (F2, f2) / sum (f2);

% frequencies in the range 2.2khz to 2.6khz betray bronchial secretion (Bruijne et al)
mic_bronchial_secretion_index = 0; 
for i = 1 : numel (f2)
	if (i > 2200 && i < 2600)
		mic_bronchial_secretion_index = mic_bronchial_secretion_index  + F2(i);
	end
end

mic_bronchial_secretion_index = mic_bronchial_secretion_index/ fs; 

mic_linear_prediction_coefficients = lpc (mic, 1);
mic_linear_prediction_coefficient = mic_linear_prediction_coefficients (2);
feature_vector = [mic_mag_avg, mic_mag_std, pitch, mic_spectral_centroid,...
    mic_bronchial_secretion_index, mic_linear_prediction_coefficient];

end
