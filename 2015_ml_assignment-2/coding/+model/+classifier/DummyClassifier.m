%%% the dummy classifier predicts the label by randomly assigning a label
%%% based on the ratio of +1/-1 examples in training data

classdef DummyClassifier < handle
   properties
      positiveRatio; % the ratio of examples with label +1
   end

   methods
       function dummyClassifierInstance = DummyClassifier (pRatio)  % constructor
           dummyClassifierInstance.positiveRatio = pRatio;
       end
       function predictedLabel = predict (instance, X)
           predictedLabel = sign(instance.positiveRatio - rand(length(X), 1));
       end
   end

   methods (Static)
      function dummyClassifierInstance = train (X, y)
        dummyClassifierInstance = model.classifier.DummyClassifier(length(X(y == 1, :)) / length(X));
      end
   end
end
