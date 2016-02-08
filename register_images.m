% register two images (render and photo) using intensity-based registration

% Author @gizem
% based on the example from: http://www.mathworks.com/help/images/examples/registering-multimodal-mri-images.html
% 2/2/2016

%% create two circular masks: one for photo one for render
%% photo mask for 0 gloss
cx=160;cy=205;ix=379;iy=380;r1=105;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss0_ball.mat') % make this a variable
photo = gloss0_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 10 gloss
cx=163;cy=207;ix=379;iy=380;r1=108;r2=113; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss10_ball.mat') % make this a variable
photo = gloss10_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 20 gloss
cx=160;cy=206;ix=379;iy=380;r1=107;r2=112; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss20_ball.mat') % make this a variable
photo = gloss20_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 30 gloss
cx=157;cy=208;ix=379;iy=380;r1=106;r2=112; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss30_ball.mat') % make this a variable
photo = gloss30_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 40 gloss
cx=158;cy=208;ix=379;iy=380;r1=108;r2=113; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss40_ball.mat') % make this a variable
photo = gloss40_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 50 gloss
cx=167;cy=212;ix=379;iy=380;r1=109;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss50_ball.mat') % make this a variable
photo = gloss50_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 60 gloss
cx=167;cy=212;ix=379;iy=380;r1=109;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss60_ball.mat') % make this a variable
photo = gloss60_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 70 gloss
cx=168;cy=213;ix=379;iy=380;r1=110;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss70_ball.mat') % make this a variable
photo = gloss70_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 80 gloss
cx=160;cy=213;ix=379;iy=380;r1=109;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss80_ball.mat') % make this a variable
photo = gloss80_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 90 gloss
cx=166;cy=214;ix=379;iy=380;r1=110;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss90_ball.mat') % make this a variable
photo = gloss90_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% photo mask for 100 gloss
cx=168;cy=214;ix=379;iy=380;r1=110;r2=115; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
photo_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('gloss100_ball.mat') % make this a variable
photo = gloss100_ball;

masked_photo = photo_mask.*photo;
imshow(masked_photo.*10)

%% render mask for all gloss levels
cx=179;cy=207;ix=379;iy=380;r1=121;r2=121; 
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
render_mask=(((x.^2.*r1^2)+(y.^2.*r2^2))<=r1^2*r2^2);

load('spheron_sphere6-70.mat') % make this a variable
im6 = multispectralImage;
render = imcrop(im6, [2517 0 379 2707]);
render_ball = imcrop(render, [0 1192 379 379]);
render_ball = render_ball.*10;

masked_render = render_mask.*render_ball;
% imshow(render_photo.*10)

%% 
figure, imshowpair(masked_photo, masked_render, 'montage')
title('Unregistered')

%% overlapping version
figure, imshowpair(masked_photo, masked_render);
title('Unregistered');
% green and magenta show places where one image is brigther than the other
% gray areas have similar intensities

%% Registration bit
% makes it easy to pick the correct optimizer and metric configuration
% these two images have different intensity distributions, which suggests a
% multimodal configuration
[optimizer,metric] = imregconfig('multimodal');

% renderRegisteredDefault = imregister(photo, renderedIm, 'affine', optimizer, metric);
% figure, imshowpair(renderRegisteredDefault, renderedIm)
% title('A: Default registration')

%% Adjust initial radius to improve the fit
optimizer.InitialRadius = optimizer.InitialRadius/100;
% optimizer.MaximumStepLength = optimizer.MaximumStepLength/100;
optimizer.MaximumIterations = 2000;

renderRegisteredAdjusted = imregister(masked_photo, masked_render, 'similarity', optimizer, metric);
figure, imshowpair(renderRegisteredAdjusted, masked_render);
title('Adjusted InitialRadius');
%%
registered_photoname = ['registered', int2str(percent_gloss),'v2.mat'];
imname = strcat('/Local/Users/gizem/Documents/Research/GlossBump/Gloss_Level_Sphere_Photos/registered_imgs_translation_spray/', registered_photoname);
save(imname, 'renderRegisteredAdjusted');
register_result = renderRegisteredAdjusted;


%% register spheron images
renderc = imcrop(renderg, [2517 0 379 2707]);
photoc = imcrop(photog, [2517 0 379 2707]);

% now let's find the spheres and crop them

%% save cropped imgs
gloss50 = hdrread('gloss50.hdr');
gloss50g = rgb2gray(gloss50);
gloss50c = imcrop(gloss50g, [0 0 379 2707]);
gloss50_ball = imcrop(gloss50c, [0 1192 380 379]);
save('gloss50c.mat','gloss50c');
save('gloss50_ball.mat', 'gloss50_ball')
imshow(gloss50_ball)

%% check if the fits look good
load('10gloss_test.mat')
im6 = multispectralImage;
render = imcrop(im6, [2517 0 379 2707]);
render_ball = imcrop(render, [0 1192 379 379]);
render_ball = render_ball.*10;
masked_render = render_mask.*render_ball;
normmaskedr = masked_render./mean(masked_render(:));

load('registered50_fit.mat')
maskedp = render_mask.*J;
normmaskedp = maskedp./mean(maskedp(:));
bigIm60 = [normmaskedp normmaskedr];
imshow(bigIm60, [1 max(bigIm60(:))])
colormap jet
colorbar
save('bigIm50.mat','bigIm50');

%% calculate the mean ratios to undo normalization on rho_s and rho_d

% calculate the mean of 