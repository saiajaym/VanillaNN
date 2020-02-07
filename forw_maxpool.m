function [x] = forw_maxpool(x)
    [m,n]=size(x);
    %dividing matrix into cells of 2*2 kernals
    x=mat2cell(x,ones(1,m/2)*2,ones(1,n/2)*2);
    for i=1:m/2
        for j=1:n/2
            %calculating max
            x{i,j}=max(x{i,j}(:));
         end 
     end
     x=cell2mat(x);
end