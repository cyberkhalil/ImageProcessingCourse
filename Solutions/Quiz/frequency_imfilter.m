    function [fltrd_img,f_img,fltrd_f_img]=frequency_imfilter(img,filter)
    % this function do same as imfilter but work on the frequency domain
    % for rgb images
        [img, revertclass] = tofloat(img);
        [M,N,bad] = size(img);
        if(bad==0)
        filter = fft2((filter), M, N);
        f_img = fft2(img);
        fltrd_f_img = f_img.*filter;
        fltrd_img=revertclass(ifft2(fltrd_f_img));
        
        f_img = abs(f_img);
        fltrd_f_img = abs(fltrd_f_img);
        fltrd_img = abs(fltrd_img);
        else
            filter = fft2((filter), M, N);
        f_img = fft2(img);
        fltrd_f_img(:,:,1) = f_img(:,:,1).*filter;
        fltrd_f_img(:,:,2) = f_img(:,:,2).*filter;
        fltrd_f_img(:,:,3) = f_img(:,:,3).*filter;
        fltrd_img=revertclass(ifft2(fltrd_f_img));
        
        
        f_img = abs(f_img);
        fltrd_f_img = abs(fltrd_f_img);
        fltrd_img = abs(fltrd_img);
        end
    end