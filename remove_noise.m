function y = remove_noise(x,n,th)
N = numel(x);
y = x;

for i = 2:N-n
	if std(y(i:i+n)) < th
		y(i) = 0;
	end
end