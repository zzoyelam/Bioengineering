%% Daniel Hondal
% HW 8B: Problem 4
%% Part A: Mesh

z = @(x,y) cos(x-0.25).*sin(y-0.9)+4
x = linspace(-.5,.5,1e3);
y = x;
[X, Y] = meshgrid(x,y);

mesh(X,Y,z(X,Y));
axis([-0.5 0.5 -0.5 0.5 3 4])
xlabel('x','fontsize',14); 
ylabel('y','fontsize',14); 
zlabel('z','fontsize',14);
colormap('jet'); % set colors to blue low and red high 
set(gca,'fontsize',10);
%% Part B: Volume

% Area of 
r = 0.5;
A = pi*r^2
truval = A*integral2( @(x,y) z(x,y),-0.5,0.5,-0.5,0.5)
xt = -0.5 + 0.5*rand(1e6,1);
yt = -0.5 + 0.5*rand(1e6,1);
xt = [xt; 0.5-xt-0.5]; % antithetic sampling
yt = [yt; 0.5-yt-0.5]; % antithetic sampling
F = A* z(xt,yt);

Fs = cumsum(F);
Ie = 1*Fs./(1:length(Fs))';
semilogx(abs(Ie-truval)/truval,'k-');
grid on;
ylabel('Percent Error')
xlabel('Samples')