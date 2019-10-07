%% Daniel Hondal
% HW 8C: Problem 3
%% Part A: Sample Rate (Hz) & Time Step (s)

timestep = mean(diff(time))
%% 
% time step = 0.0020 sec

samplerate = mean(1/timestep)
%% 
% sample rate = 500 Hz
%% Part B: Position over time
%%
plot(time,pos);
title('Position')
xlabel('Time [s]','fontsize',14);
ylabel('Position [m]','fontsize',14);
%% Part C: Velocity
%%
% Central Diff.
tc = time;
dt = mean(diff(tc));
xc = pos;
dxdt_c6 = zeros(length(xc),1); % pre-allocate acceleration values

% 6th order
coeff6 = [-49/20 6 -15/2 20/3 -15/4 6/5 -1/6];
ccd6 = [-1/60 3/20 -3/4 3/4 -3/20 1/60];
for k=1:length(xc)
    if k < 4 % forward when to few points to left        
        dxdt_c6(k) = coeff6*[xc(k)  xc(k+1)  xc(k+2) xc(k+3) xc(k+4) xc(k+5) xc(k+6)]'/dt;
    elseif k> 7 % backward when too few points to right
        dxdt_c6(k) = coeff6*[xc(k)  xc(k-1)  xc(k-2) xc(k-3) xc(k-4) xc(k-5) xc(k-6)]'/dt;
    else % central
        dxdt_c6(k) = ccd6*[xc(k-3)  xc(k-2)  xc(k-1) xc(k+1) xc(k+2) xc(k+3)]'/dt;
    end
end
%% 

plot(tc,dxdt_c6);
grid on;
title('Velocity')
xlabel('Time [s]','fontsize',14);
ylabel('Velocity [m/s]','fontsize',14);
%% 
% *ii. Max velocity*

max(abs(dxdt_c6))
%% 
% Max velocity = -1.1598 m/s
%% Part D: Acceleration Plot
%%
% Central Diff.
tc = time;
dt = mean(diff(tc));
vc = dxdt_c6;
vdt = zeros(length(vc),1); % pre-allocate acceleration values

% 6th order
coeff6 = [469/90 -223/10 879/20 -949/18 41 -201/10 1019/180 -7/10];
ccd6 = [1/90 -3/20 3/2 -49/18 3/2 -3/20 1/90];
for k=1:length(vc)
    if k < 4  % forward when to few points to left        
        vdt(k) = coeff6*[vc(k)  vc(k+1)  vc(k+2) vc(k+3) vc(k+4) vc(k+5) vc(k+6) vc(k+7)]'/dt;
    elseif k > 517  % backward when too few points to right
        vdt(k) = coeff6*[vc(k)  vc(k-1)  vc(k-2) vc(k-3) vc(k-4) vc(k-5) vc(k-6) vc(k-7)]'/dt;
    else % central
        vdt(k) = ccd6*[vc(k-3)  vc(k-2)  vc(k-1) vc(k) vc(k+1) vc(k+2) vc(k+3)]'/dt;
    end
end
%% 

plot(tc,vdt);
grid on;
title('Acceleration')
xlabel('Time [s]','fontsize',14);
ylabel('Acceleration [m/s^2]','fontsize',14);
%% 
% 
%% Part E: Acceleration Dropped to 0
% *i. Velocity Estimate*

ind = find(diff(vc)==0);
tc(ind)
%% 
% 0.5460 seconds
% 
% *ii. Acceleration Estimate*

interp1(vdt,tc,0,'pchip')
%% 
% 0.5408 seconds