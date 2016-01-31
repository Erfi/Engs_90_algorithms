Dear user:

This file contains a list of functions developed for feature extraction and
analysis from different sensors. You can see the name of each function and
a short discription of what it does!

=== extract ===
Input:
1)a filename (.mat file) 
2)a number representing epochlength (in seconds)
3)a number representing samplerate (in Hz)

Output:
A cell matrix with columns representing each sensor
Each cell contains an array of data corresponding to one 
epochlength of a time.
===============


=== extractCol ===
Similar to extrac() function but for a specific column.

Input:
1)a filename (.mat file) 
2)a number representing epochlength (in seconds)
3)a number representing samplerate (in Hz)
4)column number

Output:
A cell matrix with its only column representing the sensor chosen by the
4th parameter.
Each cell contains an array of data corresponding to one 
epochlength of a time.
=================


=== putLabel ===
%This function takes in a cellMatrix of epoches with each column
%representing a sensor and adds an extra column in the end which 
%represents the label for each epoch.

%NOTE: The number or labels should be equal (or less than) the number of
%actual epoches.
%If the number of labels are less than the number of epoches the rest of
%the epoches will be cut off!

Input: cellMatrix of epoches and a matrix (n,2) of labels
Output: labeled cellMatrix of epoches
================



 
