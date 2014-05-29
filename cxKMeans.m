function cxKMeans(InName,OutName,k)
%all input will be in string format
k = int(sym(k));

X=csvread(InName);
fprintf('read data from [%s] done k=%d\n',InName,k);
X=spconvert(X);
Y=kmeans(X,k);
csvwrite(OutName,Y);

exit;


