%%% the dummy classifier predicts the label by randomly assigning a label
%%% based on the ratio of +1/-1 examples in training data

classdef ParametricClassifier < handle
   properties
      X; 
      y;
   end

   methods
       function ParametricClassifierInstance = ParametricClassifier (X,y)  % constructor
           ParametricClassifierInstance.X = zscore(X);
           ParametricClassifierInstance.y = y;
       end
       function predictedLabel = predict (instance, X)
           predictedLabel=model.classifier.CV(X,instance.X,instance.y);
       end
   end

   methods (Static)
      function ParametricClassifierInstance = train (X, y)
        ParametricClassifierInstance = model.classifier.ParametricClassifier(X,y);
      end
   end
end
