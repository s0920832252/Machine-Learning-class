%clear workspace
clear;

% % import models
% import model.*;

X = load('./data/X.tsv');
%ZZ_X=zscore(X);
y = load('./data/y.tsv');



%Z_X=ZZ_X;
%Y_X=y;
%Z_P_X=ZZ_X;
%Y_P=y;
%[blend_accuracy, blend_Precision, blend_Recal]=CV(Z_X,Y_X);



%%%%%%%%%%%%以下 已包在CV  (CV多寫一個for迴圈而已)

% clf = model.classifier.DummyClassifier.train(Z_X, Y_X);
%   clfKNN = model.classifier.KNNClassifier.train(Z_X, Y_X);
%   clfMC = model.classifier.Multivar_Classi.train(Z_X, Y_X);
%   clfAddbKNN = model.classifier.AddbKNNClassifier.train(Z_X, Y_X);
clfPara = model.classifier.ParametricClassifier.train(X,y);

% predict the original data using the `clf`.
% predictedLabels = clf.predict(Z_P_X);
% predictedLabelsKNN = clfKNN.predict(Z_P_X);
% predictedLabelsMC = clfMC.predict(Z_P_X);
% predictedLabelsAddbKNN = clfAddbKNN.predict(Z_P_X);
% predictedLabelsBlend=sign(predictedLabelsAddbKNN+predictedLabelsKNN+predictedLabelsMC);
  predictedLabelsPara = clfPara.predict(X(101:500,:));
% calculate accuracy
% wrong predictions: predicted label != true label
% | true label | predicted | abs(diff) |
% |          1 |         1 |         0 |
% |         -1 |        -1 |         0 |
% |          1 |        -1 |         2 |
% |         -1 |         1 |         2 |

% [dummy_accuracy, dummy_Precision, dummy_Recal]=look_accuracy_Precision_Recall(predictedLabels,Y_P);
%   [KNN_accuracy, KNN_Precision, KNN_Recal]=look_accuracy_Precision_Recall(predictedLabelsKNN,Y_P);
%  [MN_accuracy, MN_Precision, MN_Recal]=look_accuracy_Precision_Recall(predictedLabelsMC,Y_P);
%  [blend_accuracy, blend_Precision, blend_Recal]=look_accuracy_Precision_Recall(predictedLabelsBlend,Y_P);
%   [AddbKNN_accuracy,AddbKNN_Precision,AddbKNN_Recal]=look_accuracy_Precision_Recall(predictedLabelsAddbKNN,Y_P);