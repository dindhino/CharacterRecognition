loadmnist <- function( N=60000 )
{
  # Loads the MNIST data from the files:
  #
  # train-images-idx3-ubyte
  # train-labels-idx1-ubyte
  #
  # ...and puts the images in X and the labels in y in a list
  # returned to the calling function.
  #
  # The input argument N is the number of digits to read. It
  # defaults to the maximum (60000)

  data <- list()

  # Make sure we don't try to read more than there actually is
  if (N>60000) N <- 60000
  
  # Read in the data
  data$X <- readBin('train-images-idx3-ubyte', 'int', n=16+28*28*N,
                                                size=1, signed=FALSE)
  data$X <- data$X[17:length(data$X)];
  dim(data$X) <- c(28*28, N)
  data$X <- t(data$X)
        
  # Read in the labels
  data$y <- readBin('train-labels-idx1-ubyte', 'int', n=8+N,
                                             size=1, signed=FALSE)
  data$y <- data$y[9:length(data$y)]

  # Return the data
  data

}
