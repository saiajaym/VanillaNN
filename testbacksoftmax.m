%make up some numbers for input array X
X = rand(5,1)

%make up some numbers for dz/dY coming in from backprop 
dzdy = rand(5,1);

%our job is to compute dz/dX, dz/dw and dz/db , both analytically and 
%by numerical derivatives, and compare (should yield same results).

%forward pass to compute Y
Y = forw_softmax(X);

%computing the backprop derivatives analytically 
[dzdx] = back_softmax(X, Y, dzdy);

%now compute them by using numerical derivatives 

% numerically compute dz/dX
eps = 1.0e-6;
dzdxnumeric = zeros(size(X));
Y = forw_softmax(X);
for i=1:size(X,1)
    newim = X;
    newim(i) = newim(i)+eps;
    yprime = forw_softmax(newim);
    deriv = (yprime-Y)/eps;
    %similar to above, deriv = dY/dxij, the deriv of all Y  wrt one xij value
    %we dot product that with deriv of z wrt all Y values, thus 
    %summing over all dz/dypq * dypq/dxij , leaving dz/dxij        
    dzdxnumeric(i) = dot(deriv(:),dzdy(:));
end

%we will just compare them by eye
%this could be more fancy, like computing max abs diff between the two
fprintf('comparison of analytic and numerical derivs conv backprop\n');
fprintf('comparing dz/dx values\n');
dzdx
dzdxnumeric