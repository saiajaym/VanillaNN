# VanillaNN

This project is an attempt to clearly understand behind the scenes math of Neural Networks.

Multiple commonly found functions (Relu, MaxPool, MeanPool, Softmax, etc.) have been implemented both for forward pass and back pass.

The back pass functions are simple numerical derivatives of the actual functions.

## Tests

To test the implementation of the back prop, numerical derivatives are compared againest analytical derivaties in the test files (test*).


### Sample comparision outputs from backward and forward pass.

#### ReLU

testbackrelu

X =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9


dzdy =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9

comparison of analytic and numerical derivs conv backprop
comparing dz/dx values

dzdx =

    17    24     1     8    15
    23     5     7    14    16
     4     6    13    20    22
    10    12    19    21     3
    11    18    25     2     9


dzdxnumeric =

   17.0000   24.0000    1.0000    8.0000   15.0000
   23.0000    5.0000    7.0000   14.0000   16.0000
    4.0000    6.0000   13.0000   20.0000   22.0000
   10.0000   12.0000   19.0000   21.0000    3.0000
   11.0000   18.0000   25.0000    2.0000    9.0000
   
#### SoftMax

testbacksoftmax

X =

    0.8444
    0.3445
    0.7805
    0.6753
    0.0067

comparison of analytic and numerical derivs conv backprop
comparing dz/dx values

dzdx =

    0.0277
   -0.0174
    0.1030
   -0.1094
   -0.0038


dzdxnumeric =

    0.0277
   -0.0174
    0.1030
   -0.1094
   -0.0038
