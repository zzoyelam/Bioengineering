%% Daniel Hondal
% HW 8B: Problem 3

fun = @() 1./(1+sinh(4*t) + 3*(log(t)).^2)
%% Part A: Quadrature v. Monte Carlo Integration
%%
tic
intval = integral(@(t) fun(t),0,3)
t1 = toc

tic
xt = 0 + 3*rand(1e6,1);
F = fun(xt);
If = 3*mean(F);
t2 = toc

Fs = cumsum(F);
Ie = 3*Fs./(1:length(Fs))';
semilogx(abs(Ie-intval)/intval,'k-');
grid on;
ylabel('Percent Error')
xlabel('Samples')
%% 
% Quadrature value  = 0.1129
% 
% MCI value = 0.1129
%% Part B: Timing
%%
formatSpec = 'Quadrature value is %f seconds.';
sprintf(formatSpec,t1)
formatSpec = 'MCI value is %f seconds.';
sprintf(formatSpec,t2)

%% Part C
% *i.* The plot shows the accuracy converging  arround 10^3 samples. 
% 
% *ii.* As the the order of magnitude of samples increases the accuracy increases 
% exponentially as well (or decreases in error as seen in the log-log plot). 
%%
loglog(abs(Ie-intval)/intval,'k-');
grid on;
ylabel('Percent Error')
xlabel('Samples')