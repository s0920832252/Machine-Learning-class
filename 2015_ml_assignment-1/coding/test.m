fid = fopen('training_data\X.dat');
X=fscanf(fid,'%g');
fidd = fopen('training_data\y.dat');
y=fscanf(fidd,'%g');
fclose(fid)
fclose(fidd)
ine=ones(200,1);
X1=[ine X];
w=[2.3;0.04];
 temp=w;
               w=w+(X1'*X1)'\(((X1'*X1)*w)-(X1'*y));
               d=((temp-w)'*(temp-w))/length(X);