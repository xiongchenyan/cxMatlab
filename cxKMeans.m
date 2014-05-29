function cxKMeans(InName,OutName,k)
%all input will be in string format
k = int(sym(k));
X=csvread(InName);
X=spconvert(X);
Y=kmeans(X,k);
csvwrite(OutName,Y);

exit;


