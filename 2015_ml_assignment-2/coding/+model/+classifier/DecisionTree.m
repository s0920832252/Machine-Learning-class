classdef DecisionTree < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        tree_struc;
    end
    
    methods
        function DecisionTreeInstance=DecisionTree(X,y)
            DecisionTreeInstance.tree_struc=build_tree(X,y);
             
        
        end
        
        function predictedLabel=predit(instance,X)
        end
        
    end
    
    methods (Static)
      function DecisionTreeInstance = train (X, y)
        DecisionTreeInstance = model.classifier.DecisionTree(X,y);
      end
    end
    
end

%  select_element  spilt_value    n*2 matrix 

function tree_struc=build_tree(X,y)
   tree_struc=zeros(ceil(log2(size(X,1))),2);
   spilt_value=spilt(X);
   select_element=max_entropy(X,y,spilt_value);
   temp=X(:,select_element);
   
   if((isempty(X(y==1,:))||(isempty(X(y==-1,:)))))
       tree_struc=winner();
   elseif()
           
   else       
       
   end
end

function win=winner(X,y)
   
end

   
%計算亂度 並選擇 
function value=max_entropy(temp,y,spilt_value)
   for i=1:size(temp,2)
     ttmp=temp(:,i);
     p1=size(ttemp(y==1,:),1)/size(ttemp,1);
     p2=size(ttemp(y==-1,:),1)/size(ttemp,1);
     Gini(i)=1-(p1^2+p2^2);  %越小越好
   end
     [val index]=sort(Gini);
     value=val(1);   
end

%每一行找出其每一個分割點並回傳
function spilt_value=spilt(X)   %等深切割(每一區  數量一樣)
   break_point=1;  
   spilt_value=zeros(break_point,size(X,2));  
   [value,index]=sort(X);
   for i=1:size(X,2)
       for j=1:break_point
       spilt_value(j,i) = value(length(X)*j/(break_point+1),i);
       end
   end
end

