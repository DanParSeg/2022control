% Adapted from https://www.ensta-bretagne.fr/jaulin/

% For this system, the state is x =(x,y,theta,v,delta)
% The v state variable, since it is a speed, it is not used in this 
% graphical representation

function pendulum_draw(x)
   clf();
   hold on;
   delta=x(1)
   axis square
  
   % Model of a front wheel (in homogeneous coordinates)
   M_wheel=[0 cos(delta-pi/2);
            0 sin(delta-pi/2);];
   

   

   % Right front wheel translated and rotated (first with respect to the chassis frame 
   % and then with respect to the fixed frame)
   M_right_wheel_transformed=M_wheel;
   
   axis([-1,1,-1,1])
   plot(M_right_wheel_transformed(1,:),M_right_wheel_transformed(2,:),'black','LineWidth',1);  
end