classdef Multivar_Classi < handle
   properties
    class_covariance1;
    class_covariance_negative1;
    class_means;
    class_means_negative1;
    class_log_Probability;
    class_log_Probability_negative1;
   end

   methods
       function Multivar_ClassiInstance = Multivar_Classi (X,y)  % constructor                       
          %class 1 and -1;
          class1=X(y==1,:);
          class_negative1=X(y==-1,:);
          Multivar_ClassiInstance.class_covariance1=cov(class1);
          Multivar_ClassiInstance.class_covariance_negative1=cov(class_negative1);
          Multivar_ClassiInstance.class_means=mean(class1);
          Multivar_ClassiInstance.class_means_negative1=mean(class_negative1);
          Multivar_ClassiInstance.class_log_Probability=log(length(class1)/length(X));
          Multivar_ClassiInstance.class_log_Probability_negative1=length(class_negative1)/length(X);
          
       end
       
       function predictedLabel = predict (instance, X)
          score1= discriminaton(X,instance.class_covariance1,instance.class_means,instance.class_log_Probability);
          score_negative2=discriminaton(X,instance.class_covariance1,instance.class_means_negative1,instance.class_log_Probability_negative1);
          predictedLabel=[];
          for i=1:length(X)
           if score1(i) > score_negative2(i)
              predictedLabel=[predictedLabel;1];
           else
              predictedLabel=[predictedLabel;-1];
           end
          end
       end          
   end

   methods (Static)
      function Multivar_ClassiInstance = train (X, y)
         Multivar_ClassiInstance = model.classifier.Multivar_Classi(X,y);
      end
   end
end

 function result=discriminaton(X,S,means,LogProbability)
          result=[];
          for i=1:size(X,1) 
            result=[result ;(-1/2*X(i,:)*(S^-1)*X(i,:)')+((means*S^-1)*X(i,:)')+(-1/2*(means*S^-1*means'+log(det(S)))+LogProbability)];
          end   
 end
