clear;

% These matrices obtained from Python notebook
A = [0 0 1 0
     0 0 0 1
     110/3 0 0 0
     -200 0 0 0];

B = [0; 0; -71/90; 14/3];

rank(ctrb(A, B)) % Since rank is 4, it's controllable!!

Q = [1 0 0 0
     0 1 0 0
     0 0 0.01 0
     0 0 0 0.01];
 
R = [0.01];

lqr(A, B, Q, R)