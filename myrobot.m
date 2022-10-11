theta1 = pi/ 6; 
theta2 = pi/ 3; 
a1 = 12;
a2 = 12; 
second_a1 = 12;
second_a2 = 12; 
H01 = [cos(theta1) -sin(theta1) 0 a1*cos(theta1);
       sin(theta1) cos(theta1) 0 a1*sin(theta1);
       0 0 1 0;
       0 0 0 1];

H12 = [1 0 0 a2*cos(theta2);
       0 cos(theta2) -sin(theta2) a2*sin(theta2);
       0 sin(theta2) cos(theta2) 0;
       0 0 0 1];
H02 = H01 * H12;
hfigg = figure(21);
axis([-5,50,0,50]);
for i=0:180
    theta2s = 3*(i*pi) / 180;
    theta1s= (i*pi) / 180;
    second_theta2s = 5*(i*pi) / 180;
    second_theta1s= 4*(i*pi) / 180;
    plot3(0,0,0,'o','Color','r');
    hold on;
    line([0,0],[0,0],[0,10]);
    hold on;
    plot3(0,0,10,'o','Color','r');
    line([0,H01Zx(a1,theta1s)],[0,H01Zy(a1,theta1s)],[10,10]);
    line([0,H01Zx(second_a1,second_theta1s)],[0,H01Zy(second_a1,second_theta1s)],[10,10],'color','r');
    hold on;
    plot3(H01Zx(a1,theta1s),H01Zy(a1,theta1s),10,'o','color','r');
    plot3(H01Zx(second_a1,second_theta1s),H01Zy(second_a1,second_theta1s),10,'o','color','r');
    hold on;
    line([H01Zx(a1,theta1s),H02Zx(a1,a2,theta1s,theta2s)],[H01Zy(a1,theta1s),H02Zy(a1,a2,theta1s,theta2s)],[10,H02Zz(a1,a2,theta1s,theta2s)]);
    line([H01Zx(second_a1,second_theta1s),H02Zx(second_a1,second_a2,second_theta1s,second_theta2s)],[H01Zy(second_a1,second_theta1s),H02Zy(second_a1,second_a2,second_theta1s,second_theta2s)],[10,H02Zz(second_a1,second_a2,second_theta1s,second_theta2s)],'color','r');
    hold on;
    plot3(H02Zx(a1,a2,theta1s,theta2s),H02Zy(a1,a2,theta1s,theta2s),H02Zz(a1,a2,theta1s,theta2s),'o','color','r');
    plot3(H02Zx(second_a1,second_a2,second_theta1s,second_theta2s),H02Zy(second_a1,second_a2,second_theta1s,second_theta2s),H02Zz(second_a1,second_a2,second_theta1s,second_theta2s),'o','color','r');
    hold off;
    axis([-5,50,0,50]);
    pause(0.5);
end

function H02zx = H02Zx(a1,a2,theta1,theta2)
H02zx = a1*cos(theta1)+a2*cos(theta1+theta2); %%y축 회전일 때 
%H02zx = (a1*cos(theta1)*cos(theta2)) + (a1*cos(theta1) -a2*sin(theta1)*sin(theta2)); %%x축 회전일 때
end

function H02zy = H02Zy(a1,a2,theta1,theta2)
H02zy =a1*sin(theta1)+(a2*sin(theta1)*cos(theta2))+(a2*sin(theta2)*cos(theta1)); 
%H02zy = (a1*sin(theta1)*cos(theta2) + (a1*sin(theta1) + a2*sin(theta2)*cos(theta1)));
end
function H02zz = H02Zz(a1,a2,theta1,theta2)
H02zz = cos(theta2);
end
function H01zx = H01Zx(a1,theta1)
H01zx = a1 *cos(theta1);
end

function H01zy = H01Zy(a1,theta1)
H01zy = a1 *sin(theta1);
end