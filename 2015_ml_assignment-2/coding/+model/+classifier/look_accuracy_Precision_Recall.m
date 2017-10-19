function [accuracy, Precision, Recall] =look_accuracy_Precision_Recall(PreditLabel,y)
  wrongPredictions = sum(abs(PreditLabel - y) / 2);
  accuracy = 1 - wrongPredictions / length(y);
  result = abs(PreditLabel - y) / 2;
  TC_PC_TABLE=[PreditLabel result];
  Precision = length(TC_PC_TABLE((PreditLabel==1)&(result==0),:))/length(PreditLabel(PreditLabel==1));
  Recall = length(TC_PC_TABLE((PreditLabel==1)&(result==0),:))/length(y(y==1));

end

