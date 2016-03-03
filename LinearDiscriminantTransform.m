function [LDT, CHI] = LinearDiscriminantTransform(activity1 , activity2, act1Name, act2Name)

% General code for Linear Discriminant Transform

% Call matrices of features in activity A and activity B, with last column
% containing number label of activity


%======= find important indeces

numfeat = length(activity1(1,:))-1; %number of feature columns
act1epochs = length(activity1(:,1));% number of epochs for activity1
act2epochs = length(activity2(:,1));% number of epochs for activity2
totaleps = act1epochs+act2epochs; %total number of epoches (datapoints)

%===ALTERNATIVE===
%make a matrix from both activities (except the last column = label)
bigmat = vertcat(activity1(:,1:numfeat), activity2(:,1:numfeat));
%take the average of each feature column
avgfeat = mean(bigmat,1);
%standard deviation of each feature column
stdfeat = std(bigmat,0,1);
%subtract mean of each column from the elements of that column (X-barX)
meanSub = bsxfun(@minus, bigmat, avgfeat);
%divide each column element by the standard deviation of each column
normbigmat = bsxfun(@rdivide, meanSub, stdfeat);
%=================
%adding the label column back
% l = vertcat(activity1(:,end), activity2(:,end));
% normbigmat = horzcat(normbigmat, l);

%find the mean of each activity from the normalized matrix
avgact1 = mean(normbigmat(1:act1epochs,:),1);
avgact2 = mean(normbigmat(act1epochs+1:totaleps,:),1);
%take differece of the two means for act1 and act2 (head to tail in Rd)
u = avgact2 - avgact1;

%normalize the u vector
norm_u = u/norm(u);
%multiply the normalized matrix with this unit vector
CHI = (normbigmat(:,1:numfeat))*norm_u';


%plot the Histogram
plotDualHistogram(CHI, act1epochs, -10,10,0.4,act1Name,act2Name);

% Order the features
u_ordered = sort(abs(norm_u), 'descend');

num_best_feats = 10;
best_feats = [];

for k = 1:num_best_feats
    best_feats = cat(2, best_feats ,find(abs(norm_u)==u_ordered(k))');
end

LDT = best_feats;

k=1;
for th = min(CHI):0.01:max(CHI);
    num = find(CHI>=th);%all indecies of the data that larger than threshold
    lTP = find(num>act1epochs);%if from act1
    lFP = find(num<=act1epochs);%if from act2
    nTP(k) = length(lTP);
    nFP(k) = length(lFP);
    TPR(k) = nTP(k)/(act2epochs);
    FPR(k) = nFP(k)/(act1epochs);
    thresh(k) = th;
    k = k+1;
end
figure;
plot(FPR,TPR, 'LineWidth' , 2);

end

