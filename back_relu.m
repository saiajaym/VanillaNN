function [dzdx] = back_relu(x,y,dzdy)
%simple derivative of relu - 1 0 if nagative 1 otherwise
    dzdx = dzdy .* (x >= 0);
end