

classdef inSampleKNNClassifier < handle
   properties
      LengthToLength; % the all x to y index top 9
      y;
      K;
   end

   methods
       function KNNClassifierInstance = KNNClassifier (X,y)  % constructor
           Z=zeros(length(X),length(X));
           KNNClassifierInstance.K=(ceil(length(X)^0.5));  % 自動取K  參考網路取法
           if(mod(ceil(length(X)^0.5),2)==0)
               KNNClassifierInstance.K=(ceil(length(X)^0.5))+1;
           end
          
           Max=zeros(length(X),KNNClassifierInstance.K);
           for i=1:length(X)
               for j=1:length(X)
                   Z(i,j)=norm(X(i,:)-X(j,:),2);
               end
               [nothingSort,index]=sort(Z(i,:));
               Max(i,:)=index(1:KNNClassifierInstance.K);               
           end
         
           KNNClassifierInstance.y=y;
           KNNClassifierInstance.LengthToLength=Max;          
          
       end
       function predictedLabel = predict (instance, Z_X)
           predictedLabel=[];
           for i=1:length(Z_X)
               count=0;
               for j=1:instance.K
                   count=count+instance.y(instance.LengthToLength(i,j));
               end
               predictedLabel=[predictedLabel;sign(count)];
           end
       end
   end

   methods (Static)
      function KNNClassifierInstance = train (X, y)
        KNNClassifierInstance = model.classifier.KNNClassifier(X,y);
      end
   end
end
