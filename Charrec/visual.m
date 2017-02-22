function visual( A, cols, bgblack, border )
% visual - display a set of small images
%
% A        the images as row vectors
% cols     [optional] number of columns in display
% bgblack  [optional] if this flag is set the background is black
% border   [optional] border pixels (default is 0)
%
 
if ~exist('cols'), cols = ceil(sqrt(size(A,1))); end
if ~exist('bgblack'), bgblack = 0; end
if ~exist('border'), border = 0; end

A = A';

% Get maximum absolute value (it represents white or black; zero is gray)
maxi=max(max(abs(A)));
mini=-maxi;

% This is the side of the window
dim = sqrt(size(A,1));

% Helpful quantities
dimm = dim-1;
dimp = dim+1;
rows = ceil(size(A,2)/cols);


% Initialization of the image
if bgblack, bgval = mini; else bgval = maxi; end
I = bgval*ones(dim*rows+rows-1+(2*border),dim*cols+cols-1+(2*border));

for i=0:rows-1
  for j=0:cols-1
    
    if i*cols+j+1>size(A,2)
      % This leaves it at background color
      
    else
      % This sets the patch
      I(border+i*dimp+1:border+i*dimp+dim, ...
	border+j*dimp+1:border+j*dimp+dim) = ...
          reshape(A(:,i*cols+j+1),[dim dim])';
    end
    
  end
end

colormap(gray(256));
imshow(I,[mini maxi]);
drawnow
