classdef LinearRegressorNM < handle
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
   
    properties
        FunctionWN;
        BN;
    end
    
    methods
        function LinearRegressorNMObj = LinearRegressorNM(X,y)
            ine=ones(200,1);
            X1=[ine X];
            LinearRegressorNMObj.BN=X1;
           % myLinearRegressorN = LinearRegressor.train(X,y);
             d=1;
            w=[0.01;0.05];%myLinearRegressorN.FunctionW;
            while(d>=0.00005)
               temp=w;
               w=w-(X1'*X1)'\(((X1'*X1)*w)-(X1'*y));
               d=((temp-w)'*(temp-w))/length(X);
            end
                   
            LinearRegressorNMObj.FunctionWN =w;
        end
       
        function predictedValue = predict (obj,X)
            
            predictedValue=(obj.BN)*(obj.FunctionWN);
            
        end
    end
    
    methods (Static)
        function LinearRegressorNMObj = train(X,y)
            LinearRegressorNMObj = model.regressor.LinearRegressorNM(X,y);
        end
    end
end
