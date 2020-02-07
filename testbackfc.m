%Sample routine for testing backprop, using convolution as example.

%make up some numbers for input array X
X = rand(5)
%make up some parameter values for convolution filter and bias
w = rand(5)
bias = 3;
%make up some numbers for dz/dY coming in from backprop 
dzdy = 2.3;

%our job is to compute dz/dX, dz/dw and dz/db , both analytically and 
%by numerical derivatives, and compare (should yield same results).

%forward pass to compute Y
Y = forw_fc(X,w,bias);

%computing the backprop derivatives analytically 
[dzdx, dzdw, dzdb] = back_fc(X, w, bias, Y, dzdy);

%now compute them by using numerical derivatives 

% numerically compute dz/dw
eps = 1.0e-6;
dzdwnumeric = zeros(size(w));
Y = forw_fc(X,w,bias);
for i=1:size(w,1)
    for j=1:size(w,2)
        filt = w;
        filt(i,j) = filt(i,j)+eps;
        yprime = forw_fc(X,filt,bias);
        deriv = (yprime-Y)/eps;
        %note, deriv = dY/dwij, the deriv of all Y values wrt one wij value
        %we dot product that with deriv of z wrt all Y values, thus 
        %summing over all dz/dypq * dypq/dwij , leaving dz/dwij
        dzdwnumeric(i,j) = deriv(:) .* dzdy;
    end
end

% numerically compute dz/dX
eps = 1.0e-6;
dzdxnumeric = zeros(size(X));
Y = forw_fc(X,w,bias);
for i=1:size(X,1)
    for j=1:size(X,2)
        newim = X;
        newim(i,j) = newim(i,j)+eps;
        yprime = forw_fc(newim,w,bias);
        deriv = (yprime-Y)/eps;
        %similar to above, deriv = dY/dxij, the deriv of all Y  wrt one xij value
        %we dot product that with deriv of z wrt all Y values, thus 
        %summing over all dz/dypq * dypq/dxij , leaving dz/dxij        
        dzdxnumeric(i,j) = dot(deriv(:),dzdy(:));
    end
end

% numerically compute dz/db
eps = 1.0e-6;
dzdbnumeric = 0;
Y = forw_fc(X,w,bias);
yprime = forw_fc(X,w,bias+eps);
deriv = (yprime-Y)/eps;
%deriv = dY/db, which we know analytically should be all 1's.
%so really, the answer we get below should just be the sum of 
%all values in dzdy
dzdbnumeric =  dot(deriv(:),dzdy(:));

%we will just compare them by eye
%this could be more fancy, like computing max abs diff between the two
fprintf('comparison of analytic and numerical derivs conv backprop\n');
fprintf('comparing dz/db values\n');
dzdb
dzdbnumeric
fprintf('comparing dz/dw values\n');
dzdw
dzdwnumeric
fprintf('comparing dz/dx values\n');
dzdx
dzdxnumeric