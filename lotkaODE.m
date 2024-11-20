function dpdt = lotkaODE(t,p)
% LOTKA Lotka-Volterra predator-prey model
delta = 0.02;
beta = 0.01;

dpdt = [p(1) .* (1 - beta*p(2));
        p(2) .* (-1 + delta*p(1))];
end

