function [dzdx] = back_maxpool (x,~,dzdy)
    [m,n]=size(x);
    ex=ones(1,m/2)*2;
    ey=ones(1,n/2)*2;
    %dividing matrix into cells of 2*2 kernals
    xc=mat2cell(x,ex,ey);
        for i=1:m/2
            for j=1:n/2
                %getting max
                [~,idx]=max(xc{i,j}(:));
                %creating new matrix with max value
                xc_max = zeros(2,2);
                xc_max(idx) = dzdy(i,j);
                %copying back to cell
                xc{i,j} = xc_max;
             end 
         end
         dzdx=cell2mat(xc);
end