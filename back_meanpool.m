function [dzdx] = back_meanpool (x,~,dzdy)
    [m,n]=size(x);
    x = ones(m,n);
    ex=ones(1,m/2)*2;
    ey=ones(1,n/2)*2;
    %converting matrix to cells of size 2*2
    xc=mat2cell(x,ex,ey);
        for i=1:m/2
            for j=1:n/2
                %dividing kernal by 1/4 and multiplying with corresponding
                %dz/dy
                xc{i,j} = xc{i,j}*0.25*dzdy(i,j);
             end 
         end
         dzdx=cell2mat(xc);
end