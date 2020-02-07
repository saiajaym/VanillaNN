function [y] =forw_softmax(x)
    %sigma(exp^x)
    den = sum(exp(x));
    %softmax
    y=(exp(x)/den);
end