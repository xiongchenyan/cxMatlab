function cxKMeans(InName,OutName,k)
%all input will be in string format
k = str2num(k);

X=csvread(InName);
fprintf('read data from [%s] done',InName);
X=spconvert(X);
%k = min(size(X,1),k);
%use the rule of thumb to choose k:
k=min(size(X,1),ceil(sqrt(size(X,1)/2.0)));

fprintf('input size [%d][%d]\n',size(X,1),size(X,2));
fprintf('k = [%d]\n',k);

%run several times, and pick best Y
ReRunTime = 10;
BestY = ones(size(X,1),1);
MinSumD = -1;
for i=1:ReRunTime
    [Y,C,sumd]=kmeans(X,k,'emptyaction','singleton');
    ThisSum = sum(sumd);
    if -1 == MinSumD
        MinSumD = ThisSum;
    end
    if MinSumD >= ThisSum
        MinSumD = ThisSum;
        fprintf('get a better distance sum: [%f]\n',ThisSum);
        BestY = Y;
    end
end
csvwrite(OutName,BestY);
fprintf('output [%d][%d] to [%s]\n',size(BestY,1),size(BestY,2),OutName);
exit;


