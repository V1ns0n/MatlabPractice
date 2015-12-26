function [ w_wheels ] = actuated_inverse_solution( v_car,la,lb,r )
%The actuated inverse solution of mecanum wheel
%input the desired velocity of car(3*1,/R-R Vx,Vy,Wr)
%output the actuated velocity(4*1,W1,W2,W3,W4) of each wheel 
Ja=[-1,1,la+lb;1,1,-(la+lb);-1,1,-(la+lb);1,1,la+lb];
w_wheels=1/r*Ja*v_car;
end

