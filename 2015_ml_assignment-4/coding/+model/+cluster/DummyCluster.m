classdef DummyCluster < handle
   methods (Static)
      function output = cluster (X)
          k = 10; % cluster in 10 groups
          
          n = size(X, 1);
          output = zeros(n, 1);
          for i = 1 : n
              output(i, 1) = round(rand * k);
          end
      end
   end
end
