function [X y] = loadmnist( N )
% loadmnist - loads the MNIST data
%
% SYNTAX:
% [X y] = loadmnist( N );
%
% The function takes a single parameter N, the number of digits
% to read. It defaults to the maximum (60000).
% 
% It returns
% X   the 60,000 images, each of size 28-by-28 in the rows of X
% y   the 60,000 labels (numbers between 0 and 9)
%
% EXAMPLE:
% >> [X y] = loadmnist();
% >> visual(X(78:123,:));
% >> y(78:123)'
%

if ~exist('N'), N=60000; end
if N>60000, N=60000; end    

% Read in the images
fid = fopen('train-images-idx3-ubyte');
X = fread(fid,(28*28*N)+16);
fclose(fid);
X = X(17:end);
X = reshape(X,28*28,N)';

% Read in the labels
fid2 = fopen('train-labels-idx1-ubyte');
y = fread(fid2,N+8);
fclose(fid2);
y = y(9:end);

