clear all; clc;

% load image
fprintf('Load image and dictionary.\n');
I = double(imread('Data/kodim04.png'))./255.0;
%I = double(imread('Data/kodim07.png'))./255.0;
%I = double(imread('Data/kodim15.png'))./255.0;
lIm =  0.2989*I(:,:,1) + 0.587*I(:,:,2) + 0.114*I(:,:,3);
Iratio = I ./ repmat(lIm,[1 1 3]);

% load dictionary
load('dictionary.mat');

% enhancement parameters
r = 16;
eps = 0.1^2;
n = 5;
lambda = 0.05;

% detail decomposition by guided filter
addpath('guided-filter');
base = guidedfilter(lIm, lIm, r, eps);
detail = lIm - base;

fprintf('Reconstructing detail layer...\n');
boost = n * detail;
boost1 = sparse_reconstruction(boost,D);

fprintf('Optimizing detail layer...\n');
boost1 = detail_optimization(lIm, boost1, lambda);

% image enhancement
R = lIm + boost;
R1 = lIm + boost1;

R = repmat(R,[1 1 3]) .* Iratio;
R = min(1,max(0,R));

R1 = repmat(R1,[1 1 3]) .* Iratio;
R1 = min(1,max(0,R1));

imshow([I R R1]);

% compute EME values
fprintf('Computing EME values...\n');
X = uint8(I .* 255);
Y = uint8(R .* 255);
Z = uint8(R1 .* 255);
 
X = rgb2gray(X);
Y = rgb2gray(Y);
Z = rgb2gray(Z);

eme1 = EME(X);
eme2 = EME(Y);
eme3 = EME(Z);

fprintf('EME of source image: %f \n', eme1);
fprintf('EME of initial enhanced result by guided filter: %f \n', eme2);
fprintf('EME of final enhanced result: %f \n', eme3);

% save enhanced results
imwrite(R, 'results/rst1.png');
imwrite(R1, 'results/rst2.png');

fprintf('Enhanced results saved. \n');



