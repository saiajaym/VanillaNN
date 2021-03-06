%Sample routine for testing backprop, using convolution as example.

%make up some numbers for input array X
X = magic(4)
%make up some numbers for dz/dY coming in from backprop 
dzdy = magic(2)

%our job is to compute dz/dX, dz/dw and dz/db , both analytically and 
%by numerical derivatives, and compare (should yield same results).

%forward pass to compute Y
Y = forw_maxpool(X);

%computing the backprop derivatives analytically 
[dzdx] = back_maxpool(X, Y, dzdy);

%now compute them by using numerical derivatives 

% numerically compute dz/dX
eps = 1.0e-6;
dzdxnumeric = zeros(size(X));
Y = forw_maxpool(X);
for i=1:size(X,1)
    for j=1:size(X,2)
        newim = X;
        newim(i,j) = newim(i,j)+eps;
        yprime = forw_maxpool(newim);
        deriv = (yprime-Y)/eps;
        %similar to above, deriv = dY/dxij, the deriv of all Y  wrt one xij value
        %we dot product that with deriv of z wrt all Y values, thus 
        %summing over all dz/dypq * dypq/dxij , leaving dz/dxij        
        dzdxnumeric(i,j) = dot(deriv(:),dzdy(:));
    end
end

%we will just compare them by eye
%this could be more fancy, like computing max abs diff between the two
fprintf('comparison of analytic and numerical derivs maxpool backprop\n');
fprintf('comparing dz/dx values\n');
dzdx
dzdxnumeric