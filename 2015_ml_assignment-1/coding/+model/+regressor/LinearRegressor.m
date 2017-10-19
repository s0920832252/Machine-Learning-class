classdef LinearRegressor < handle
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        FunctionW;
        B;
    end
    
    methods
        function LinearRegressorObj = LinearRegressor(X,y)
            ine=ones(200,1);
            X1=[ine X];
            LinearRegressorObj.B=X1;
            LinearRegressorObj.FunctionW = ((X1')*X1)^(-1)*(X1')*y;
        end
       
        function predictedValue = predict (obj,X)
            
            predictedValue=(obj.B)*(obj.FunctionW);
            
        end
    end
    
    methods (Static)
        function LinearRegressorObj = train(X,y)
            LinearRegressorObj = model.regressor.LinearRegressor(X,y);
        end
    end
end
