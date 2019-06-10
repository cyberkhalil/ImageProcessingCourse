close all;
clear all;
clc;

%tform = maketform( 'custom', ndims_in, ndims_out, forward_fcn, inv_function, tdata)
%example 1
forward_fcn = @(wz, tdata) [3*wz(:, 1), 2*wz(: ,2)];
inverse_fcn = @(xy, tdata) [xy(:,1)/3, xy(:,2)/2];
tform1 = maketform('custom', 2, 2, forward_fcn, inverse_fcn, []);
WZ = [ 1 1 ; 3 2];
XY = tformfwd(WZ, tform1);
WZ_prime = tforminv(XY, tform1);

%example 2
forward_fcn = @(wz, tdata) [wz(:, 1)+0.4*wz(: ,2), wz(: ,2)];
inverse_fcn = @(xy, tdata) [xy(:,1)-0.4*xy(: ,2), xy(:,2)];

tform2 = maketform( 'custom', 2, 2, forward_fcn, inverse_fcn, []);
XY = tformfwd(WZ, tform2);
WZ_prime = tforminv(XY, tform2);

%example 3
WZ = pointgrid([0 0; 100 100]);
figure;
vistform(tform1, WZ);
figure;
vistform(tform2, WZ);