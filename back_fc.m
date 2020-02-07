%derivative for wx+b
function[dzdx,dzdw,dzdy] = back_fc(x,w,b,y,dzdy)

    dzdx = dzdy .* w;
    dzdw = dzdy .* x;
    
end