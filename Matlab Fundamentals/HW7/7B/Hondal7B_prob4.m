%% Daniel Hondal
% HW 7B: Problem 4
%% Part A
%%

X = mpg.Weightlbs;
Y = mpg.Powerhorsepower;
Z = mpg.Efficiencympg;
scatter3(X,Y,Z)
xlabel('Weight [lbs]','fontsize',14);
ylabel('Horsepower [W]','fontsize',14);
zlabel('Efficiency [mpg]','fontsize',14);
set(gca,'fontsize',12);
%% Part B
%%
A = [X Y ones(length(X),1)]; % create coefficient matrix for regression
B = Z;
soln = A\B;
%% 
% $$f\left(x,y\right)=-0\ldotp 0099*x-0\ldotp 0210*y+66\ldotp 8550$$
%% Part C
%%
est = [3025 130 1]*soln; % estimate of foot length based on 1800mm stature and 480mm forearm length
scatter3(X,Y,Z)
hold on
scatter3(3025,130,est,180,'rp'); % add estimated point to plot
xlabel('Weight [lbs]','fontsize',14);
ylabel('Horsepower [W]','fontsize',14);
zlabel('Efficiency [mpg]','fontsize',14);
set(gca,'fontsize',12);