# Optimal-Transport

A simple sinkhorn algorithm to solve optimal transport problem writen in Matlab.

- Why I Create this repo? 
- Because I am strugglling with understanding one of the core algorithm in papar [SuperGlue](https://arxiv.org/abs/1911.11763) (image matching). I want to figure out what happened in sinkhorn algorithm step by step. It will be helpful if you encounter the same problem.


# Demo

- Given: a cost matrix S, two margins a, b, entropic regularization \lambda and convergence parameter \epslion
- Output: optimal transport matrix P and Sinkhorn distance(optional) 

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
It will show a picture like below by running the code, it is what assignment matrix looks like.

![image](https://user-images.githubusercontent.com/18531182/161440518-9b7854e4-158d-4aac-a0f1-714adc374fe9.png)

# Reference

1. [Notes on Optimal Transport](https://michielstock.github.io/posts/2017/2017-11-5-OptimalTransport)
