function [y] = forw_meanpool(x)
    [m,n]=size(x);
    %converting matrix to cells of 2*2 kernals
    x=mat2cell(x,ones(1,m/2)*2,ones(1,n/2)*2);
        for i=1:m/2
            for j=1:n/2
                %calculating mean
                x{i,j}=mean(x{i,j}(:));
             end 
         end
         y=cell2mat(x);
end