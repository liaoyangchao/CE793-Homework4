% Student: Yangchao Liao (Student ID: 1299252)
% Homework 4
% CE793 - Computational Methods for Engineering - Fall 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3: solve ODE y' = i*y

clear; close all; clc

f = @(t)(exp(i*t));
df = @(t,y)(i*y);
startt = 0;
endt = 20;
y0 = 1;

T = 0:0.1:20;
L1 = plot(T,f(T),'-k','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use Explicit Euler method with the step size h = 0.1
h = 0.1;

startt = 0;
endt = 20;
y1 = zeros(1,20);
y1(1) = y0 + h*df(startt,y0);
for i = 2:20
    y1(i) = y1(i-1) + h*df(startt+h*(i-1),y1(i-1));
end

T1 = 0:1:20;
L2 = plot(T1,[y0,y1],'-r','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use second-order Runge-Kutta method with the step size h = 0.1
h = 0.1;

startt = 0;
endt = 20;
xk = startt:h:endt;
n= (endt-startt)/h+1;
startt = ones(length(y0),1);
y1(:,1) = y0';
for i = 1:n
    x1 = xk(i)*startt;
    k1 = df(x1,y1(:,i));
    k2 = df(x1+(3/4)*h*startt,y1(:,i)+(3/4)*k1*h);
    y1(:,i+1) = y1(:,i)+((1/3)*k1+(2/3)*k2)*h;
    y(i,:) = y1(:,i)';
end
x = xk;
y = y';

L3 = plot(x,y,'-b','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use fourth-order Runge-Kutta method with the step size h = 0.1
h = 0.1;

startt = 0;
endt = 20;
xk = startt:h:endt; 
y(1) = 1;
for n = 1:length(xk)-1
    k1 = df(xk(n),y(n));
    k2 = df(xk(n)+h/2,y(n)+h/2*k1);
    k3 = df(xk(n)+h/2,y(n)+h/2*k2);
    k4 = df(xk(n)+h,y(n)+h*k3);
    y(n+1) = y(n)+h/6*(k1+2*k2+2*k3+k4);
end

L4 = plot(x,y,'-m','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use Adams Bashforth method with the step size h = 0.1
h = 0.1;

x = startt:h:endt; 
y1=1;
for n = 1:length(x)-1
    y1(n+1) = y1(n)+h*df(x(n),y1(n)); 
    y1(n+1) = y1(n)+h/2*(df(x(n),y1(n))+df(x(n+1),y1(n+1)));
end

L5 = plot(x,y1,'-g','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Plotting section
lgd=legend([L1,L2,L3,L4,L5],'exact solution', ...
    'explicit Euler method: h = 0.1','second-order Runge-Kutta method: h = 0.1',...
   'fourth-order Runge-Kutta method: h = 0.1','Adams Bashforth method: h = 0.1','NumColumns',1);
set(lgd,'Location','SouthWest','Orientation','vertical');set(lgd,'Box','off'); 

ylim([-3,3])
xlabel('t','FontName','Arial','FontSize',25)
ylabel('y','FontName','Arial','FontSize',25)
hold on

set(gca,'linewidth',1.5,'FontName','Arial','FontSize',25);
set(gcf,'Color','w','Units','inches','position',[0,0,8,6]);
set(legend,'FontName','Arial');box on;
AxesH = gca;InSet = get(AxesH, 'TightInset');
set(AxesH, 'Position', [InSet(1:2), 1-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])
hold on;