%import model.regressor.DummyRegressor
%import model.regressor.LinearRegressor
%import model.regressor.LinearRegressorNM
%import model.regressor.LocalWeightLinearRegressor
import model.regressor.*
clear %clear workspace

%--- TODO: please import the dataset here ---%
fid = fopen('training_data\X.dat');
X=fscanf(fid,'%g');
fidd = fopen('training_data\y.dat');
y=fscanf(fidd,'%g');
fclose(fid);
fclose(fidd);
%--- TODO: modify the DummyRegressor to your LinearRegressor & LinearRegressorLocalWeight ---%
%---       please follow the specs strickly                              ---%

%-*Construct a Map object that contains tau data for several numbers:---%
Keyset = {'tau0.1', 'tau1', 'tau10', 'tau100'};
Valueset = [0.1, 1, 10, 100];
cfg = containers.Map(Keyset, Valueset);

%---  train dummy regressor 
%myRegressor = DummyRegressor.train(X,y);
%value = myRegressor.predict(X);

%---  train linear regressor in Analytic
%myLinearRegressor = LinearRegressor.train(X,y);
%valueLR = myLinearRegressor.predict(X);

%---  train linear regressor in newton
myLinearRegressorNM = LinearRegressorNM.train(X,y);
valueLRNM = myLinearRegressorNM.predict(X);

%---  train local weight linear regressor
myLinearRegressorLocalWight = LinearRegressorLocalWight.train(X,y);
valueLWLR = myLinearRegressorLocalWight.predict(X,cfg('tau0.1'));
%valueLWLR1 = myLinearRegressorLocalWight.predict(X,cfg('tau1'));
%valueLWLR2 = myLinearRegressorLocalWight.predict(X,cfg('tau10'));
%valueLWLR3 = myLinearRegressorLocalWight.predict(X,cfg('tau100'));


%%% plot data %%%
scatter (X,y,'g');
hold on;

%--- TODO: plot the local weight linear regressor you train ---%
%plot(sort(X), sort(valueLWLR),'b');
scatter (X,valueLWLR,'M','.');
%scatter (X,valueLWLR1,'.','y');
%scatter (X,valueLWLR2,'.','c');
%scatter (X,valueLWLR3,'.','k');

%--- TODO: plot the linear regressor in netwon you train ---%
plot(X, valueLRNM,'y');

%--- TODO: plot the dummy regressor you train ---%
%plot(X, value, 'r');

%--- TODO: plot the linear regressor you train ---%
%plot(X, valueLR,'b');

title('coding work');xlabel('x-label');ylabel('y-label');

legend('資料分布','localweight','linear in netwon');
%legend('資料分布','Newton method','dummy regression','linear in Analytic');
%legend('tau0.1','tau1','tau10','tau100','linear in Analytic');










hold off;


