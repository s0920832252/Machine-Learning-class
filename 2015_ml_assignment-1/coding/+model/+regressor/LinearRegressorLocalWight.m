%%% the dummy regressor predicts the value by mean value of y

classdef LinearRegressorLocalWight < model.regressor.LinearRegressor
   properties
       y% the mean value we predict
   
   end
   
   methods
       function LinearRegressorLocalWightObj = LinearRegressorLocalWight(X,y)  % constructor
           
           LinearRegressorLocalWightObj@model.regressor.LinearRegressor(X,y);
           LinearRegressorLocalWightObj.y=y;
         
       end
       function predictedValue = predict (obj, X,cfg)
           ine=ones(200,1);
           X1=[ine X];
           
           for i=1:length(X)
               L=exp((((X-X(i)).^2)/(2*(cfg)^2)).*(-1)); 
               L1=(L*L')^0.5;
               temp= (X1'*L1*X1);
               temp1=(X1'*L1*obj.y);
               temp2=temp\temp1;
               FunctionWW(: , i)=temp2;
           end
           
           for i = 1:length(X)
            predictedValue(i)=X1(i, : )*(FunctionWW( : , i));
           end
        
       end
   end
   
   methods (Static)
       function LinearRegressorLocalWightObj = train (X, y)
        LinearRegressorLocalWightObj = model.regressor.LinearRegressorLocalWight(X,y);
     
       end
   end
end