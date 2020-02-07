function [y]= forw_fc(x,w,b)
%forward wx+b 
  y =  sum(w.*x, "all") + b;
end