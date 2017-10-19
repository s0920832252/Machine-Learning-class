classdef AddbKNNClassifier < handle
   properties
        XX;
        yy;
        
   end

   methods
       function AddbKNNClassifierInstance = AddbKNNClassifier (X,y)  % constructor   
           AddbKNNClassifierInstance.XX=X;
           AddbKNNClassifierInstance.yy=y;
        
       end
       function predictedLabel = predict (instance, X)
           vote_number=9;
           len=size(instance.XX,1);
           %predict=makeKNN(instance.XX,instance.yy,X);
           predict=[];
           for i=1:vote_number
           start=fix((len*(i-1)/vote_number));
           en=fix((len*i/vote_number));
           predict=[predict makeKNN(instance.XX(1+start:en,:),instance.yy(1+start:en),X)]; 
           end
           predictedLabel=sign(sum(predict,2));
           
           
           
       end
   end

   methods (Static)
      function AddbKNNClassifierInstance = train (X, y)
        AddbKNNClassifierInstance = model.classifier.AddbKNNClassifier(X,y);
      end
   end
end

function predictedLabelsKNN=makeKNN(XX,y,X)
    clfKNN = model.classifier.KNNClassifier.train(XX, y);
    predictedLabelsKNN = clfKNN.predict(X);   
end
