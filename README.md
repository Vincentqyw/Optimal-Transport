# Optimal-Transport
A simple sinkhorn algorithm to solve optimal transport problem writen in Matlab



``` matlab
lam = 1;
epslion = 1e-6;

% S_  = rand(3,4);

S  = [1,2,3,4;
     5,6,7,8;
     2,6,1,3];

[m,n] = size(S);

a  = ones(m,1);
b  = ones(1,n);

[P_bar, error] = SinkhornAlgorithm(S,a,b,lam,epslion);

figure;
axis equal
imagesc(P_bar)
set(gcf,'color',[1,1,1]);
box off;
axis off
```
It will show a picture like below, it is what assignment matrix looks like:

![image](https://user-images.githubusercontent.com/18531182/161440518-9b7854e4-158d-4aac-a0f1-714adc374fe9.png)
