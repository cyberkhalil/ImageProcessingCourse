    function [fltrd_img,f_img,fltrd_f_img]=frequency_imfilter(img,filter)
    % this function do same as imfilter but work on the frequency domain    
        [img, revertclass] = tofloat(img);
        [M,N] = size(img);
        filter = fft2((filter), M, N);
        
        f_img = fft2(img);
        fltrd_f_img = f_img.*filter;
        fltrd_img=revertclass(ifft2(fltrd_f_img));
        
        f_img = abs(f_img);
        fltrd_f_img = abs(fltrd_f_img);
        fltrd_img = abs(fltrd_img);
    end