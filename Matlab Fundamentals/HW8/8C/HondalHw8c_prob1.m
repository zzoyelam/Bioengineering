%% Daniel Hondal
% HW 8C: Problem 2
%% Part A: 1st order Forward Differencing
%%
% Central Diff.
ta = linspace(0,2*pi,5);
dt = mean(diff(ta));
xa = sin(ta);
v = zeros(length(p),1); % pre-allocate acceleration values

cv = zeros(length(p),1); % pre-allocate acceleration values
for k=1:length(v)
    if k < 2 % forward when to few points to left
        cv(k) = ( -3/2*p(k) +2*p(k+1) -1/2*p(k+2) )/dt;
    elseif k> 10 % backward when too few points to right
        cv(k) = ( 3/2*p(k) -2*p(k-1) +1/2*p(k-2) )/dt;
    else % central
        cv(k) = ( -1/2*p(k-1) + 1/2*p(k+1) )/dt;
    end
end
%% 
subplot(2,1,2);
plot(t,fv,'k-o'); hold on;
grid on;
axis tight;
title('Velocity')
xlabel('Time [s]','fontsize',14);
ylabel('Velocity [m/s]','fontsize',14);
set(gca,'fontsize',14);
%% Part B: 1st order Backwards Differencing
%%
tb = linspace(0,2*pi,10);
xb = sin(tb);
% Backwards Diff.
v = zeros(length(p),1); % pre-allocate acceleration values

for k=1:length(a)
    if k>2 % backward when too few points to right
        bv(k) = ( p(k) -p(k-1))/dt;
    else % forward
        bv(k) = ( -p(k) + p(k+1))/dt;
    end
end
subplot(2,1,2);
plot(t,bv,'r-o')
grid on;
axis tight;
%% Part C: 2nd order Central Differencing
%%
tc = linspace(0,2*pi,100);
xc = sin(tc);
% Central Diff.
cv = zeros(length(p),1); % pre-allocate acceleration values
for k=1:length(v)
    if k < 2 % forward when to few points to left
        cv(k) = ( -3/2*p(k) +2*p(k+1) -1/2*p(k+2) )/dt;
    elseif k> 10 % backward when too few points to right
        cv(k) = ( 3/2*p(k) -2*p(k-1) +1/2*p(k-2) )/dt;
    else % central
        cv(k) = ( -1/2*p(k-1) + 1/2*p(k+1) )/dt;
    end
end
%% 
% 
%% Part D: Comparison
% *i. Velocity Estimates from All Methods of Differentiation*
%%
subplot(2,1,2);
plot(t,cv,'g-o')
grid on;
axis tight;
legend('Forward','Backward','Central','location','northeast');
%% 
% 
% 
% *ii. Velocity Estimates at t = 6.3s  from All Methods of Differentiation*

% Velocity from Forward
fv_est = interp1(t,fv,6.3,'pchip')
% Velocity from Backward
bv_est = interp1(t,bv,6.3,'pchip')
% Velocity from Central
cv_est = interp1(t,cv,6.3,'pchip')