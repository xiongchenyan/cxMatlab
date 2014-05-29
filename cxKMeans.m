function cxKMeans(InName,OutName,k)
%all input will be in string format
k = str2num(k);

X=csvread(InName);
fprintf('read data from [%s] done k=%d\n',InName,k);
X=spconvert(X);
fprintf('input size [%d][%d]\n',size(X,1),size(X,2));
Y=kmeans(X,k,'emptyaction','singleton');
csvwrite(OutName,Y);
fprintf('output [%d][%d] to [%s]\n',size(Y,1),size(Y,2),OutName);
exit;


