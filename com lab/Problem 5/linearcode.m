%Task: Matlab code to generate linear block code (7,4)
clear all; close all; clc; % Clear all data
% Generator matrix  /systematic block code
P=[1 1 0; 0 1 1; 1 1 1; 1 0 1]; % P is parity matrix
G=[eye(4) P];
Ht = [P' eye(3)]';  % PARITY CHECK MATRIX
% array of input
u = [ [0 0 0 0];[0 0 0 1];[0 0 1 0];[0 0 1 1];[0 1 0 0];[0 1 0 1];
   [0 1 1 0];[0 1 1 1];[1 0 0 0];[1 0 0 1];[1 0 1 0];[1 0 1 1];[1 1 0 0];
   [1 1 0 1];[1 1 1 0];[1 1 1 1]];
% initialising the codeword output array
B = zeros(length(u),7);
% initialising the decoded output array
D = zeros(length(u),3);
% generate linear block code (7,4)
for i = 1:length(u)
   row = u(i,:);
   B(i,:) =mod(row * G,2);
end
% decoding syndrome of non error input coded from linear block code (7,4)
for i = 1:length(B)
   row = B(i,:);
   D(i,:) =mod(row * Ht,2);
end
% decoding syndrome of  error input coded from linear block code (7,4)
r = [[1 1 1 1 0 1 0];[1 0 1 1 1 0 0]];
for i = 1:2
   row = r(i,:);
   S =mod(row * Ht,2);
   if S==[0 0 0]
       e=[0 0 0 0 0 0 0];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(1,:)
       e=[0 0 0 0 0 0 1];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(2,:)
       e=[0 0 0 0 0 1 0];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(3,:)
       e=[0 0 0 0 1 0 0];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(4,:)
       e=[0 0 0 1 0 0 0];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(5,:)
       e=[0 0 1 0 0 0 0];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(6,:)
       e=[0 1 0 0 0 0 0];
       y=bitxor(r(i,:),e);
   end
   if S==Ht(7,:)
       e=[1 0 0 0 0 0 0];
       y=bitxor(r(i,:),e);
   end
   'received pattern is'
   r(i,:)
   'error pattern is';
   e
   'correct bits are'
   y
end



