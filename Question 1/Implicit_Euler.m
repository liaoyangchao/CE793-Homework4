function [x,y]=Implicit_Euler(odefun,xspan,y0,h,varargin)
x=xspan(1):h:xspan(2);
y(1)=y0;
for k=1:length(x)-1
z0=y(k)+h*feval(odefun,x(k),y(k),varargin{:});
z1=inf;
while abs(z1-z0)>1e-4
z1=y(k)+h*feval(odefun,x(k+1),z0,varargin{:});
z0=z1;
end
y(k+1)=z1;
end
x=x;y=y;
