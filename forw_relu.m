function [y] = forw_relu(x)
% y = max(0,x)
    y = x .* (x > 0);
end

