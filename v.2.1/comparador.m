function [img,output1,output2,msg] = comparador(im1, im2, level, threshold)


    [w1,h1,d1]=size(im1);
    [w2,h2,d2]=size(im2);
    img = ones(w1,w2);
    output1 = w1;
    output2 = w2;
    if(w1 ~= w2)
        msg = 'Different Height Size';    
        return ;
    end
    if(h1 ~= h2)
        msg = 'Different Width Size';  
        return ;
    end
    if(d1 ~= d2)
        msg = 'Diferent dimension';
        return ;
    end
    
    im1 = im2uint8(im1);
    im2 = im2uint8(im2);
    
    dif = abs(double(im1) - double(im2));
    try
            %if image is RGB, then each channel is subtracted
            dif=(dif(:,:,1)+dif(:,:,2)+dif(:,:,3))/3;
    catch
    end
    [output1,output2]=find(dif>threshold);
    img=dif;
    msg = 'Pixels have mistakes!';
    return;
    
