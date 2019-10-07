%% Daniel Hondal
% HW 8B: Problem 2

t = 0:10;
a = [0 2 6 8 9 11 14 18 16 14 11];
v = 5+cumtrapz(t,a);
plot(t,v)
title('Velocity');
xlabel('time (s)');
ylabel('acceleration (m/s^2)');