#install.packages("wesanderson")
library(wesanderson)
library(caTools)  
library(plotly)
library(matlab)

jet.colors = c("white", wes_palette("Zissou1", 254, type = c("continuous")))

dx <- 10000                   # define width
dy <- 10000                 # define height
Z  <- complex(real = rep(seq(-2, 2, length.out = dx), each = dy),
              imag = rep(seq(-2, 2, length.out = dy), dx))
Z <- matrix(Z, dy, dx)       # reshape as square matrix of complex numbers
C <- -0.835 - 0.2321i             # initialize C to Julia set
X <- array(0, c(dy, dx, 10)) # initialize output 3D array


for (j in 1:10) {
  for (k in 1:5) {
    
    Z <- Z^(j) + Z^(j-1)  + C              
    
  }  
  X[,,j] <- exp(-abs(Z))
  Z  <- complex(real = rep(seq(-1.8, 1.8, length.out = dx), each = dy),
                imag = rep(seq(-1.2, 1.2, length.out = dy), dx))
  Z <- matrix(Z, dy, dx)
  C <-  -0.835 - 0.2321i 
}




write.gif(X, "Julia_set-wes_color.gif",col = jet.colors, delay = 50)

