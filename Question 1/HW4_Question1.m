% Student: Yangchao Liao (Student ID: 1299252)
% Homework 4
% CE793 - Computational Methods for Engineering - Fall 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1: solve ODE y' + 0.5y = 0

clear; close all; clc

f = @(t)(exp(-0.5*t));
df = @(t,y)(-0.5*y);
startt = 0;
endt = 20;
y0 = 1;


%% Use Explicit Euler method with the step size h = 1.0
h = 1;

y1 = zeros(1,20);
y1(1) = y0 + h*df(startt,y0);
for i = 2:20
    y1(i) = y1(i-1) + h*df(startt+h*(i-1),y1(i-1));
end

T = 0:1:20;
L1 = plot(T,f(T),'-k','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on
T1 = 0:1:20;
L2 = plot(T1,[y0,y1],'-r','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use Explicit Euler method with the step size h = 4.2
h = 4.2;

y2 = zeros(1,20);
y2(1) = y0 + h*df(startt,y0);
for i = 2:20
    y2(i) = y2(i-1) + h*df(startt+h*(i-1),y2(i-1));
end

T1 = 0:1:20;
L3 = plot(T1,[y0,y2],'-b','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use Implicit Euler method with the step size h = 1.0
h = 1;

df = @(t,y)(-0.5*y);
[t,y3]=Implicit_Euler(df,[0 20],h,1);

L4 = plot(t,y3,'-m','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use Implicit Euler method with the step size h = 4.2
h = 4.2;

df = @(t,y)(-0.5*y);
[t,y4]=Implicit_Euler(df,[0 20],h,1);

L5 = plot(t,y4,'-g','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Plotting section
lgd=legend([L1,L2,L3,L4,L5],'exact solution', ...
    'explicit Euler method: h = 1.0','explicit Euler method: h = 4.2',...
   'implicit Euler method: h = 1.0','implicit Euler method: h = 4.2','NumColumns',1);
set(lgd,'Location','SouthWest','Orientation','vertical');set(lgd,'Box','off'); 

xlabel('t','FontName','Arial','FontSize',25)
ylabel('y','FontName','Arial','FontSize',25)
hold on

set(gca,'linewidth',1.5,'FontName','Arial','FontSize',25);
set(gcf,'Color','w','Units','inches','position',[0,0,8,6]);
set(legend,'FontName','Arial');box on;
AxesH = gca;InSet = get(AxesH, 'TightInset');
set(AxesH, 'Position', [InSet(1:2), 1-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])
hold on;