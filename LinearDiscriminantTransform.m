function [LDT] = LinearDiscriminantTransform(activity1 , activity2)

% General code for Linear Discriminant Transform

% Call matrices of features in activity A and activity B, with last column
% containing number label of activity


%======= find important indeces

numfeat = length(activity1(1,:))-1; %number of feature columns
act1epochs = length(activity1(:,1));% number of epochs for activity1
act2epochs = length(activity2(:,1));% number of epochs for activity2

totaleps = act1epochs+act2epochs; %total number of epoches (datapoints)

% Make large matrix
bigmat = zeros(totaleps, numfeat+1);
bigmat(1:act1epochs,:) = activity1;
bigmat(act1epochs+1:totaleps,:) = activity2;

avgfeat = zeros(1,numfeat);
stdfeat = zeros(1,numfeat);
normbigmat = zeros(totaleps,numfeat+1);

%===ALTERNATIVE===
%make a matrix from both activities (except the last column = label)
% bigmat = vertcat(activity1(:,1:numfeat), activity2(:,1:numfeat));
%take the average of each feature column

%=================

% Normalize large matrix

for n = 1:numfeat
    avgfeat(n) = mean(bigmat(:,n));
    stdfeat(n) = std(bigmat(:,n));
    normbigmat(:,n) = (bigmat(:,n)-avgfeat(n))/stdfeat(n);
end

normbigmat(:,numfeat+1) = bigmat(:,numfeat+1);

% Find difference between two vectors

avgact1 = zeros(1,numfeat);
avgact2 = zeros(1,numfeat);

for i = 1:numfeat
    avgact1(i) = mean(normbigmat(1:act1epochs,i));
    avgact2(i) = mean(normbigmat(act1epochs+1:totaleps,i));
end

% Find normalized vector difference

u = avgact2-avgact1;
norm_u = u./sqrt(avgact2.^2+avgact1.^2);
norm_u = norm_u(:);

% Multiply 
CHI = (normbigmat(:,1:numfeat))*norm_u;

hist(CHI(1:act1epochs));
h1 = findobj(gca, 'Type', 'patch');
set(h1, 'FaceColor','r','EdgeColor','k','facealpha', 0.5);
hold on
hist(CHI(act1epochs+1:totaleps));
% h2 = findobj(gca, 'Type', 'patch');
% set(h2, 'FaceColor','g','EdgeColor','k','facealpha', 0.5);
hold off


% Order the features

u_ordered = sort(abs(norm_u), 'descend');

num_best_feats = 10;
best_feats = zeros(1,num_best_feats);

for k = 1:num_best_feats
    best_feats(k) = find(abs(norm_u)==u_ordered(k));
end

LDT = best_feats;

end

