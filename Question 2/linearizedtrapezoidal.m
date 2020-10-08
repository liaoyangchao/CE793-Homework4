function linearizedtrapezoidal(odefun,xspan,y0,h)
f=inline(odefun);
x=xspan(1):h:xspan(2);    
y(1)=y0; 
for i=1:length(x)   
    y(i+1)=y(i)+h*f(x(i),y(i));       
    for k=1:2*(length(x))     
        y(i+1)=y(i)+h*(f(x(i),y(i))+f(x(i+1),y(i+1)))/2;    
    end
end
x=x;y=y;