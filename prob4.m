%---------------User inputs-------------------------%
init_height = input('What is the initial height?: ');
init_velocity = input('What is the initial velocity?: ');
angle_degrees = input('Angle in degrees: ');
x_comp = input('x-component acceleration: ');
y_comp = input('y-component acceleration: ');
%--------------If y=0 and signs------------------------------%
if y_comp==0
    error('y=0, No free fall')
elseif y_comp>0
    error('free fall must have positive y-component')
elseif x_comp<0
    error('X-component cannot be negative')
end
%-------------components of velocity-------------%
vx = init_velocity*cosd(angle_degrees);
vy = init_velocity*sind(angle_degrees);
k=[(y_comp/2),vy,init_height];
l=roots(k);
j = max(l);
d = 0:0.1:j;
a=length(d)+1;
b=length(d);
%----------------for pre allocation-----------%
x = zeros(1,a);
y = zeros(1,a);
%---------------for initializing before function------------------%
m=0.1;
y(1)=init_height;
%--------------Projectile for graph---------% 
for i = 1:b
    range = (x_comp*(m^2))/2 + vx*m;
    height = (y_comp*(m^2))/2 + vy*m +init_height;
    x(i+1) = range;
    y(i+1) = height;
    m=m+1/10;
end
plot(x,y),ylim([0 max(y)+1]),ylabel('Height'),xlabel('Distance')
