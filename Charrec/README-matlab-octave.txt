
Example use of MNIST data in Matlab and Octave:

First, load the data:

>> [X y] = loadmnist();

There are 60,000 small (28-by-28) images of digits. Each such image is
scanned (pixel-by-pixel) into one row of X. Note: if you do not have
enough memory to read in all the digits, you can use

>> [X y] = loadmnist( N );

where N is a smaller number of digits to read (for example 5000). To 
display a subset of the images, you can use:

>> visual(X(78:123,:));

To show the corresponding correct labels:

>> y(78:123)'

