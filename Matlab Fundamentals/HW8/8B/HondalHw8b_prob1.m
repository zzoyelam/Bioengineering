%% Daniel Hondal
% HW 8B: Problem 1
%% Part A: Analytic Integral
% $$y = 3\int_{2}^{5} x^2 exp(0.2x)$$
% $$u = x^2\\du = 2x dx \\dv = e^{(x/5)}\\v 
% = 5 e^{(x/5)}$$
% 
% $$15\left.x^2 e^{0.2 x} \right | _ 2^5 - 30\int_ 2^5 e^{0.2 x} x\, dx$$

% $$-60\left.e^{0.4 x} \right | _ 2^5 + 375e +(-150xe^{(0.2x)}) | _ 2^5 +150\int_ 
% 2^5 e^{0.2 x} x\, dx$$
% 
% $$150 \int_2^5 e^{x/5} \, dx+240 e^{2/5}-375 e$$
% 
% $$750 \left(e-e^{2/5}\right)+240 e^{2/5}-375 e = 258.525$$
% 
% 
%% Part B: Computational Integral

fun = @(x) 3*x.^2 .* exp(0.2*x);
y = integral(fun,2,5);