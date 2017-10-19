classdef KNNClassifier < handle
   properties
      X; % the all x to y index top 9
      y;
      K;
      nothingSort;
   
   end

   methods
       function KNNClassifierInstance = KNNClassifier (X,y)  % constructor                       
          KNNClassifierInstance.y=y;
          KNNClassifierInstance.X=X;
          KNNClassifierInstance.K=(ceil(length(X)^0.5));  % 自動取K  參考網路取法
          if(mod(ceil(size(X,1)^0.5),2)==0)
               KNNClassifierInstance.K=(ceil(length(X)^0.5))+1;
          end
          if(KNNClassifierInstance.K>size(X,1))
               KNNClassifierInstance.K=1;
          end
       end
       function predictedLabel = predict (instance, Z_X)
           Z=zeros(length(Z_X),length(instance.X));
            
           Max=zeros(length(Z_X),instance.K);
           for i=1:size(Z_X,1)
               for j=1:size(instance.X,1)
                  Z(i,j)=norm(Z_X(i,:)-instance.X(j,:),2);
               end
               [instance.nothingSort,index]=sort(Z(i,:));
               Max(i,:)=index(1:instance.K);      
           end
        
           predictedLabel=[];
           for i=1:size(Z_X,1)
               count=0;
               for j=1:instance.K
                   count=count+instance.y(Max(i,j));
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
