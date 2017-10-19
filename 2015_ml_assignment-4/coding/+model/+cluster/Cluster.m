classdef Cluster < handle
   methods (Static)
      function output = cluster (X)
         XX=X; 
          k = 10; % cluster in 10 groups
          k_center=zeros(k,1);
          means=mean(XX);
          n = size(XX, 1);
          Xdist=zeros(n,1);         
          output=zeros(n,1);
          
         for i=1:n
           %Xdist(i)=dot(XX(i,:)-means,XX(i,:)-means);
           Xdist(i)=norm(XX(i,:)-means,2);
         end
         [value,index]=sort(Xdist,'descend');
         k_center=XX(index(1:k),:);
         
         
       % q=0;
         O=zeros(n,1);         
         while 1
             for i=1:n
                 %X_K_dist=dot(XX(i,:),k_center(1,:));
                 X_K_dist=norm(XX(i,:)-k_center(1,:),2);
                 label=1;
                 for j=2:k
                   %d=dot(XX(i,:),k_center(j,:));
                   d=norm(XX(i,:)-k_center(j,:),2);
                   if( X_K_dist>d )
                       X_K_dist=d;
                       label=j;                       
                   end
                 end
                 output(i,1)=label;             
                
             end
             
             if(norm(O-output)==0) 
                break;  
             end
             O=output;          
             for i=1:k
                 k_center(i)=mean(XX(output==i));
             end
             %   q=q+1;
         end
       %  q
      end
   end
end

