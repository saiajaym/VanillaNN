%a simplified derivative of softmax 
function [dzdx] = back_softmax(x,y,dzdy)
    %dy/dx = I*e^x/sum(e^x) - y*y'
   dydx = (eye(size(y,1)) .* exp(x))/sum(exp(x)) - y*y';
   %dz/dx =  dot product of dz/dy . dy/dx 
   dzdx = (sum(dzdy .* dydx))';
end