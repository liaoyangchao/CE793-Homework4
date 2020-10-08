% Student: Yangchao Liao (Student ID: 1299252)
% Homework 4
% CE793 - Computational Methods for Engineering - Fall 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2: solve ODE y' + y(1-y) = 0

clear; close all; clc

f = @(t)(1./(1+exp(t)));
df = @(t,y)(y*(y-1));
startt = 0;
endt = 1;
y0 = 1/2;

T = 0:0.05:1;
L1 = plot(T,f(T),'-k','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on

%% Use direct trapezoidal method with the step size h = 0.1
h = 0.1;

x=0:h:1;
t(1)=0;
y(1)=1/2; 
for n=1:length(x)-1  
    t(n+1)=t(n)+h;
    y(n+1)=y(n)+h*(y(n)*(y(n)-1));  
    y(n+1)=y(n)+h/2*(y(n)*(y(n)-1)+y(n+1)*(y(n+1)-1));
end
x=t;y=y;

L2 = plot(x,y,'-r','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Use linearized trapezoidal method with the step size h = 0.1
h = 0.1;

x=0:h:1;    
y(1)=1/2; 
for i=1:length(x)-1  
    y(i+1)=y(i)+h*df(x(i),y(i));       
    for k=1:2*(length(x)-1)     
        y(i+1)=y(i)+h*(df(x(i),y(i))+df(x(i+1),y(i+1)))/2;    
    end
end
x=x;y=y;


L3 = plot(x,y,'-b','LineWidth',1.5,'MarkerFaceColor','w','MarkerSize',12); hold on


%% Plotting section
lgd=legend([L1,L2,L3],'exact solution', ...
    'direct trapezoidal method: h = 0.1','linearized trapezoidal method: h = 0.1','NumColumns',1);
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

set(legend,'FontName','Arial','FontSize',17);box on;
saveas(gca,'Question2.fig');