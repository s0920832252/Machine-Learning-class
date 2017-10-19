function [predictedLabelslabel] = CV( X,Z_X,Y_X )

  clfKNN = model.classifier.KNNClassifier.train(Z_X, Y_X);
  clfMC = model.classifier.Multivar_Classi.train(Z_X, Y_X);
  clfAddbKNN = model.classifier.AddbKNNClassifier.train(Z_X, Y_X);

  predictedLabelsKNN = clfKNN.predict(X);
  predictedLabelsMC = clfMC.predict(X);
  predictedLabelsAddbKNN = clfAddbKNN.predict(X);
  predictedLabelslabel=sign(predictedLabelsAddbKNN+predictedLabelsKNN+predictedLabelsMC);
  %[predictedLabelsKNN predictedLabelsMC predictedLabelsAddbKNN predictedLabelslabel]
%   norm(predictedLabelsKNN-predictedLabelsAddbKNN)
%   norm(predictedLabelsKNN-predictedLabelsMC)
%   norm(predictedLabelsMC-predictedLabelsAddbKNN)


len=size(Z_X,1);
for i=1:10
ZP_X=Z_X(1+(i-1)*len/10:i*len/10,:);
YP=Y_X(1+(i-1)*len/10:i*len/10);
ZPX=Z_X;
YX=Y_X;
ZPX(1+(i-1)*len/10:i*len/10,:)=[];
YX(1+(i-1)*len/10:i*len/10)=[];
  clfKNN = model.classifier.KNNClassifier.train(ZPX, YX);
  clfMC = model.classifier.Multivar_Classi.train(ZPX, YX);
  clfAddbKNN = model.classifier.AddbKNNClassifier.train(ZPX, YX);

  predictedLabelsKNN = clfKNN.predict(ZP_X);
  predictedLabelsMC = clfMC.predict(ZP_X);
  predictedLabelsAddbKNN = clfAddbKNN.predict(ZP_X);
  predictedLabelsBlend=sign(predictedLabelsAddbKNN+predictedLabelsKNN+predictedLabelsMC);
  %predictedLabel=[predictedLabel;predictedLabelsBlend];

  [KNN_accuracy(i), KNN_Precision(i), KNN_Recal(i)]=model.classifier.look_accuracy_Precision_Recall(predictedLabelsKNN,YP);
  [MN_accuracy(i), MN_Precision(i), MN_Recal(i)]=model.classifier.look_accuracy_Precision_Recall(predictedLabelsMC,YP);
  [AddbKNN_accuracy(i),AddbKNN_Precision(i),AddbKNN_Recal(i)]=model.classifier.look_accuracy_Precision_Recall(predictedLabelsAddbKNN,YP);
 [blend_accuracy(i), blend_Precision(i), blend_Recal(i)]=model.classifier.look_accuracy_Precision_Recall(predictedLabelsBlend,YP);
 
end
CV_blend_accuracy=mean(blend_accuracy)
CV_blend_Precision=mean(blend_Precision)
CV_blend_Recal=mean(blend_Recal)
% KNNaccuracy=mean(KNN_accuracy);
% KNNPrecision=mean(KNN_Precision);
% KNNRecal=mean(KNN_Recal);
% MNaccuracy=mean(MN_accuracy);
% MNPrecision=mean(MN_Precision);
% MNRecal=mean(MN_Recal);
% AddbKNNaccuracy=mean(AddbKNN_accuracy);
% AddbKNNPrecision=mean(AddbKNN_Precision);
% AddbKNNRecal=mean(AddbKNN_Recal);

end

