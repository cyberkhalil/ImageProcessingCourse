function Main()
%% Settings
% @copy GPL version 3
clc;close all;clear;
%% create img cell
img = {};
%% gui code

% Main Figuare GUI
figure("Name","HomeWork 3","Position",[200 100 950 500],"MenuBar","none","Resize","off");

% List of the initially available images
imgs_list = ["coloredChips.png","autumn.tif","canoe.tif","car1.jpg","car2.jpg","peppers.png","strawberries.jpg","Choose other ..."];

% Pop menu to choose image from
cimg = uicontrol("Style","popupmenu");
set(cimg,"Position",[550 455 120 40]);
set(cimg,"String",imgs_list);
set(cimg,"Callback",@assign_img);

% Toggle button to make the image gray scaled or colored 
colored = uicontrol('Style','togglebutton','Position',[270 470 80 25],"String","Colored");
set(colored,"Callback",@assign_img);

jLabel = javaObjectEDT('javax.swing.JLabel','<html><font color="green" size="6">SET #3</html>');
javacomponent(jLabel,[420,465,80,40]);

add_help_button(gcf,"About this software","This is home work set #3 for image processing course in <a href=""https://ucas.edu.ps/"">UCAS</a> made by <a href=""https://github.com/khalil2535"">Mahmoud Khalil</a> for Dr.<a href=""https://sites.google.com/ucas.edu.ps/adahdooh/"">Ahmed Aldahdooh</a>.<br><br> How to use ? <br> Just click on button's , It's straight forward ! (see ""?"" button for each question for more information) <br><br><a href=""https://www.gnu.org/licenses/gpl-3.0.en.html"">License &#169; GPL 3</a> <br> This means you are free to use/edit/sell/change this software while you distribute a copy of the original or your modified code with the software. for more information click on the license above.");

% HW1 GUI
jLabel = javaObjectEDT('javax.swing.JLabel','<html><font color="red" size="6">SET #1</html>');
HW1.Label = javacomponent(jLabel,[60,435,80,40]);

HW1.Q1 = uicontrol("Position",[25 375 110 35]);
HW1.Q1.String = "Question 1";
HW1.Q1.Callback = @HW1_Q1;

HW1.Q2 = uicontrol("Position",[25 275 110 35]);
HW1.Q2.String = "Question 2";
HW1.Q2.Callback = @HW1_Q2;

HW1.Q3 = uicontrol("Position",[25 175 110 35]);
HW1.Q3.String = "Question 3";
HW1.Q3.Callback = @HW1_Q3;

% HW2 GUI
jLabel = javaObjectEDT('javax.swing.JLabel','<html><font color="blue" size="6">SET #2</html>');
HW2.Label = javacomponent(jLabel,[840,435,80,40]);

HW2.Q1 = uicontrol("Position",[835 375 110 30]);
HW2.Q1.String = "Question 1";
HW2.Q1.Callback = @HW2_Q1;

HW2.Q2.A = uicontrol("Position",[835 300 110 30]);
HW2.Q2.A.String = "Question 2 (A)";
HW2.Q2.A.Callback = @HW2_Q2_A;

HW2.Q2.B = uicontrol("Position",[835 225 110 30]);
HW2.Q2.B.String = "Question 2 (B)";
HW2.Q2.B.Callback = @HW2_Q2_B;


HW2.Q3 = uicontrol("Position",[835 150 110 30]);
HW2.Q3.String = "Question 3";
HW2.Q3.Callback = @HW2_Q3;



%% Assigning img.Name , img.Value , img.Type and showing the image..
    function assign_img(~,~)
        if cimg.String(cimg.Value) == "Choose other ..."
            [filename, folder] = uigetfile('*.png;*.jpg;*.tif','Select an Image');
            if ~filename
                return;
            end
            img.Name = [folder filename];
        else
            img.Name = cell2mat(cimg.String(cimg.Value));
        end
        
        disp("processing assign_img ..");
        % get image values
        img_info = imfinfo(img.Name);
        img.Type = img_info.ColorType;
        img.Colored = colored.Value;
        
        if img.Type == "grayscale"
            img.Value = imread(img.Name);
            [img.Width,img.Height]= size(img.Value);
            imshow(img.Value);
        else
            if img.Type == "truecolor"
                img.Value = imread(img.Name);
            else
                % changing indexed to rgb
                [indexed_value,indexed_map] = imread(img.Name);
                img.Value = im2uint8(ind2rgb(indexed_value,indexed_map));
            end
            
            % un used variable contains number 3 (r , g , b)
            [img.Width,img.Height,~]= size(img.Value);
            
            % if not Colored then change colored img to gray
            if img.Colored == 0
                img.Type = "grayscale";
                img.Value = rgb2gray(img.Value);
            end
            
        end
        img.Size = img.Width * img.Height;
        imshow(img.Value);
        jLabel = javaObjectEDT('javax.swing.JLabel',"<html><font color=""#800080"" size=""3"">Info( Size: "+img.Size+", Type: "+img.Type+" , Width: "+img.Width+" , Height: "+img.Height+" )</html>");
        javacomponent(jLabel,[350,10,400,40]);
        disp("assign_img done");
    end

%% Initialize default values
colored.set('value',1); % true
assign_img(cimg);

%% HW1_Q1 code
    function HW1_Q1(~,~)
        fig = figure("Name","HW1_Q1 "+img.Name);
        add_help_button(fig,"About HW1_Q1","In this question i changed the intensity of the image ; In the original image the intensity is from 0 to 255 increasing 1 value for each step , in the next image i changed this increasing rate to be 4 value for each step which means the new intensities are [2,6,..,254] , in the next one the rate increased to 8 at a step and so on ...");
        
        x = 2; % number of images on x axsis
        y = 3; % number of images on y axsis

        g = @(i,s) (floor(i/s)*s) + s/2;
        imshowadjusted = @(image , steps_number) imshow(g(image,steps_number*2));

        % show original image
        subplot(x,y,1);
        imshow(img.Value);
        title('Original');

        for index=2:6
            subplot(x,y,index);
            imshowadjusted(img.Value,2^index);
            title(['Adjusted with step of ' num2str(2^index)]);
        end
    end

%% HW1 Q2 code
    function HW1_Q2(~,~)
        fig = figure("Name","HW1_Q2 : "+img.Name);
        add_help_button(fig,"About HW1_Q2","In this question i used bitget method to get the n''th bit plane which is a set of bits corresponding to a given bit position in each of the binary numbers representing the image.");
        
        x = 3; % number of images on x axsis
        y = 3; % number of images on y axsis

        % show original image
        subplot(x,y,1);
        imshow(img.Value);
        title('Original');

        for i=1:8
            subplot(x,y,i+1);
            imshow(bitget(double(img.Value),i,'uint8'));
            title([num2str(i) '-bit plane']);
        end
    end

    function HW1_Q3(~,~)
        fig = figure("Name","HW1_Q3 : "+img.Name); % create a new figure
        add_help_button(fig,"About HW1_Q3","Every image pixel contains 8-bit number ; the first image is the first bit for each pixel , and if the image is rgb one then it''s the first bit for the red ,green and blue 8-bit numbers  , then  the second image contains the 2''nd bit incrementally with the first one (contains 1''st & 2''nd) , and each image contains the next bit incrementally.");
        
        x = 2; % number of images on x axsis
        y = 4; % number of images on y axsis
        
        % create @shaping handle
        if(img.Type=="truecolor") % shaping for colored image
            r_unit_size = 1:img.Size;
            g_unit_size = 1+img.Size:2*img.Size;
            b_unit_size = 1+2*img.Size:3*img.Size;
            
            shaping = @(f_dec) reshape([f_dec(r_unit_size),f_dec(g_unit_size),f_dec(b_unit_size)] ,img.Width,img.Height,3);
        else    % shaping for not colored (gray) image
            shaping = @(f_dec)reshape(f_dec,img.Width,img.Height);
        end
        
        f_bin = dec2bin(img.Value);
        f_bin_flipped = fliplr(f_bin);
        
        for i=1:8
            subplot(x,y,i);
            f_i_flipped = f_bin_flipped(:,1:i);
            f_i = fliplr(f_i_flipped);
            f_dec = bin2dec(f_i) * ((2^(9-i))-1);


            f_final = shaping(f_dec);
            
            imshow(uint8(f_final));
            title([num2str(i) '-bit']);
        end
    end

    function HW2_Q1(~,~)
        fig = figure("Name","HW2_Q1 : "+img.Name); % create a new figure
        add_help_button(fig,"About HW2_Q1","In this question i used 3 methods which are :<br><b>imadjust</b> increases the contrast of the image by mapping the values of the input intensity image to new values.<br><br><b>histeq</b> performs histogram equalization. It enhances the contrast of images by transforming the values in an intensity image.<br><br><b>adapthisteq</b> performs contrast-limited adaptive histogram equalization.");
        
        x = 2; % number of images on x axsis
        y = 4; % number of images on y axsis
        
        %% origin
        subplot(x,y,1);
        imshow(img.Value);
        title('origin');
        
        subplot(x,y,1+y);
        imhist(img.Value);
        title('origin histogram');
        
        
        %% imadjust
        subplot(x,y,2);
        g = imadjust(img.Value, [], [], 0.5); % imadjust : power nthroot
        imshow(g);
        title('imadjust');
        
        subplot(x,y,2+y);
        imhist(g);
        title('imadjust histogram');
        
        
        %% histeq
        
        subplot(x,y,3);
        g = histeq(img.Value);
        imshow(g);
        title('histeq');
        
        subplot(x,y,3+y);
        
        imhist(g);
        
        title('histeq histogram');
        
        %% adapthisteq
        
        subplot(x,y,4);
        if img.Type =="grayscale"
            g = adapthisteq(img.Value);
        else
            g(:,:,1) = adapthisteq(img.Value(:,:,1));
            g(:,:,2) = adapthisteq(img.Value(:,:,2));
            g(:,:,3) = adapthisteq(img.Value(:,:,3));
        end
        imshow(g);
        title('adapthisteq');
        
        subplot(x,y,4+y);
        imhist(g);
        title('adapthisteq histogram');
    end

   function HW2_Q2_A(~,~)
       fig = figure("Name","HW2_Q2_A : "+img.Name); % create a new figure
       add_help_button(fig,"About HW2_Q2_A","The first 3 images are filtered by the <b>low pass filter</b> which smooth or blur the images by decreasing the disparity between intensities.<br><br> the other 3 is filtered by <b>high pass filter</b> which is known by sharpenning the images returning the high frequency components from the image.");
       x = 2; % number of images on x axsis
       y = 3; % number of images on y axsis

       % filters
       f(:,:,1) = fspecial('average',3); % first low filter
       f(:,:,2) = 1/10*[1 1 1;1 2 1;1 1 1]; % second low filter
       f(:,:,3) = 1/16*[2 1 2;1 4 1;2 1 2]; % third low filter

       f(:,:,4) = 1/9*[-1 -1 -1;-1 8 -1; -1 -1 -1]; % first high filter
       f(:,:,5) = 1/6*fspecial('laplacian',0); % second high filter
       f(:,:,6) = 1/16*[-1 -2 -1;-2 12 -2;-1 -2 -1]; % third high filter
       
       % plotting
       for i=1:length(f(:,:,:))
           subplot(x,y,i);
           g = imfilter(img.Value,f(:,:,i));
           imshow(g);
           title(i);
       end
   end

    function HW2_Q2_B(~,~)
        % TODO : try to make scalable labels & buttons..
        fig = figure("Name","HW2_Q2_B : "+img.Name); % create a new figure
        add_help_button(fig,"About HW2_Q2_B","This question demonstrate that the original image consists of a low-pass-filtered image and a high-pass-filtered image. <br><br> from first three images we demonstrated :<br> high-pass-filtered image = original image - low-pass-filtered image <br><br> from second three images we demonstrated that :<br> low-pass-filtered image = original image - high-pass-filtered image  <br><br> That's also means : <b>original image = low-pass-filtered image + high-pass-filtered image</b>");
        x = 3;
        y = 3;
        
        %% section 1
        subplot(x,y,1)
        title('original');
        imshow(img.Value);
        
        subplot(x,y,2)
        title('low_pass_filter');
        low_pass_filter = [1 1 1;1 -7 1;1 1 1];
        g1 = imfilter(img.Value,low_pass_filter);
        imshow(g1);
        
        % will be high_pass_filter
        subplot(x,y,3)
        title('result');
        imshow(img.Value-g1);        
        
        %% section 2
        subplot(x,y,y+1)        
        title('original');
        imshow(img.Value);


        subplot(x,y,y+2)
        title('high_pass_filter');
        high_pass_filter = 1/2*[-1 -1 -1;-1 8 -1;-1 -1 -1];
        g2 = imfilter(img.Value,high_pass_filter);
        imshow(g2);

        % will be low_pass_filter
        subplot(x,y,y+3)
        title('result');
        imshow(img.Value-g2);

        %% section 3
        subplot(x,y,y+y+1)
        title('low_pass_filter');
        imshow(g1);


        subplot(x,y,y+y+2)
        title('high_pass_filter');
        imshow(img.Value-g1);

        % will be original
        subplot(x,y,y+y+3)
        title('result');
        imshow(img.Value);
    end

    function HW2_Q3 (~,~)
        fig = figure("Name","HW2_Q3 : "+img.Name); % create a new figure
        add_help_button(fig,"About HW2_Q3","In this question we noticed that the EDx for both prewitt & sobel filtters returns sharpened image by the <b>x-axis</b> when you see EDx filtered images you will notice that just <b>x-axis</b> edges more will appear. <br><br> same for the EDy , which returns the same but for the <b>y-axis</b> edges , see EDy filtered images. <br><br> so the summation between the two filters will give both <b>x and y-axis</b> edges , when we see <b>G (EDx+EDy)</b> filtered images we noticed that is correct.");
        x = 2; % number of images on x axsis
        y = 4; % number of images on y axsis

        % Equations from question text
        GetG = @(Gx ,Gy) sqrt(power(Gx,2)+power(Gy,2));
        GetGx = @(EDx,I) im2double(imfilter(I,EDx));
        GetGy = @(EDy,I) im2double(imfilter(I,EDy));

        %% Section a
        EDx = -fspecial('prewitt')'; %[-1 0 1;-1 0 1;-1 0 1];
        EDy = -fspecial('prewitt');  %[-1 -1 -1;0 0 0;1 1 1];
        Gx = GetGx(EDx,img.Value);
        Gy = GetGy(EDy,img.Value);
        G = GetG(Gx,Gy);

        subplot(x,y,1);
        imshow(img.Value);
        title('origin');

        subplot(x,y,2);
        imshow(Gx);
        title('EDx prewitt filter');

        subplot(x,y,3);
        imshow(Gy);
        title('EDy prewitt filter');

        subplot(x,y,4);
        imshow(G);
        title('G prewitt filter');

        %% Section b
        EDx = -fspecial('sobel')'; %[-1 0 1;-2 0 2;-1 0 1];
        EDy = -fspecial('sobel');  %[-1 -2 -1;0 0 0;1 2 1];
        Gx = GetGx(EDx,img.Value);
        Gy = GetGy(EDy,img.Value);
        G = GetG(Gx,Gy);

        subplot(x,y,y+1);
        imshow(img.Value);
        title('origin');

        subplot(x,y,y+2);
        imshow(Gx);
        title('EDx sobel filter');

        subplot(x,y,y+3);
        imshow(Gy);
        title('EDy sobel filter');

        subplot(x,y,y+4);
        imshow(G);
        title('G sobel filter');        
    end

    function add_help_button(fig,title,content)
        help_box = uicontrol("String","?");
        function render_help(~,~)
            pos = get(fig, 'Position');
            set(help_box,"Position",[pos(3)-25,pos(4)-25,25,25]);
        end
        function show_help(~,~)
            help_fig = figure("resize","off","position",[200,200,600,300]);
            help_label = javaObjectEDT('javax.swing.JLabel','<html><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;'+title+'<br><hr><br>&nbsp;'+content+'</html>');
            javacomponent(help_label,[10,10,help_fig.Position(3)-10,help_fig.Position(4)-20]);
            help_label.setVerticalAlignment(1);
        end
        render_help();
        set(help_box,"Callback",@show_help);
        fig.SizeChangedFcn = @render_help; 
    end

end
% TODO : try to make it executable