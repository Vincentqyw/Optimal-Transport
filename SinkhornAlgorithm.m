function [P_bar, error] = SinkhornAlgorithm(S,a,b,lam,epslion)
    
%     Computes the optimal transport matrix and Slinkhorn distance using the
%     Sinkhorn-Knopp algorithm
% 
%     Inputs:
%         - S : cost matrix (mxn)
%         - a : vector of marginals (m,1)
%         - b : vector of marginals (n,1)
%         - lam : strength of the entropic regularization
%         - epslion : convergence parameter
% 
%     Outputs:
%         - P : optimal transport matrix (mxn)
%         - error : Sinkhorn distance
%     Author: realcat 
%     Date  : 2022.04.03


% add dustbin channel
    dust= 5; %TODO
    [m,n] = size(S);
    S_bar = [S,dust * ones(m,1);
             dust *ones(1,n+1)];
    a     = [a;n];
    b     = [b,m];
    [m,n] = size(S_bar);
    P_bar = exp(-lam * S_bar);
    P_bar = P_bar / sum(P_bar(:));

    max_iters = 100;
    counter   = 0;

    while 1
       u     = sum(P_bar,2);                 % sum of rows
       P_bar = P_bar .* repmat(a./ u,[1,n]); % scale rows
       v     = sum(P_bar,1);                 % sum of cols
       P_bar = P_bar .* repmat(b./ v,[m,1]); % scale cols
       error = max((sum(P_bar,2) - a));      % check error
       
       C     = P_bar(1:end-1,1:end-1).*S_bar(1:end-1,1:end-1); % total cost

       disp(['error = ', num2str(error)]);
       if(error < epslion || counter > max_iters)
           break;
       end
       counter = counter + 1;
    end

end
