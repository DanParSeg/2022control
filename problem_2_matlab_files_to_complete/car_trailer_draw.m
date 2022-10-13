% Adapted from https://www.ensta-bretagne.fr/jaulin/

% For this system, the state is x =(x,y,theta,v,delta)
% The v state variable, since it is a speed, it is not used in this 
% graphical representation

function car_trailer_draw(x)

   % Extraction of the state variables
   px=x(1);
   py=x(2);
   theta=x(3);
   thetar=x(4)
   v=x(5);
   delta=x(6);
  
   % Model of the chassis of the car without front wheels (in homogeneous coordinates)
   M_chassis=[-1  4 5  5 4 -1 -1 -1 0  0  -1  1  0 0 -1 1 0 0 3 3 3; 
              -2 -2 -1 1 2 2  -2 -2 -2 -3 -3 -3 -3 3  3 3 3 2 2 3 -3;
              ones(1,21)];
  
   % Model of a front wheel (in homogeneous coordinates)
   M_wheel=[-1 1;
            0 0;
            1 1]; 
   
   
   % Translation and rotation of the whole car (chassis and front wheels) 
   % with respect to the fixed frame
   TR_px_py_theta=[cos(theta),-sin(theta), px;
                 sin(theta),cos(theta), py;
                 0 0 1]; 
   
   % Chassis of the car translated and rotated
   M_chassis_transformed=TR_px_py_theta*M_chassis;   
   
   % Translation and rotation matrix for the right wheel with respect to the chassis frame 
   TR_right_wheel_delta = [cos(delta),-sin(delta), 3;
                           sin(delta),cos(delta), 3 ;
                           0 0 1]; 
   
   % Translation and rotation matrix for the left wheel with respect to the chassis frame
   TR_left_wheel_delta = [cos(delta),-sin(delta), 3;
                          sin(delta),cos(delta), -3;
                          0 0 1]; 
   
   % Right front wheel translated and rotated (first with respect to the chassis frame 
   % and then with respect to the fixed frame)
   M_right_wheel_transformed=TR_px_py_theta*TR_right_wheel_delta*M_wheel; 
   
   % Reft front wheel wheel translated and rotated (first with respect to the chassis frame 
   % and then with respect to the fixed frame)
   M_left_Wheel_transformed=TR_px_py_theta*TR_left_wheel_delta*M_wheel; 
   
   %-----------------------------------------------------------------------
   
   % Model of the trailer (in homogeneous coordinates)     
   M_trailer=[-1  2  5  5 2 -1 -1 -1 0  0  -1  1  0 0 -1 1 0 0 2 ; 
              -2 -2  0  0 2 2  -2 -2 -2 -3 -3 -3 -3 3  3 3 3 2 2 ;
              ones(1,19)];

   T_trailer=[1,0,-5;
              0,1,0;
              0 0 1];
   R_trailer=[cos(thetar-theta),-sin(thetar-theta), 0;
              sin(thetar-theta),cos(thetar-theta), 0;
              0 0 1];

   M_trailer_transformed=TR_px_py_theta*R_trailer*T_trailer*M_trailer;
   
   %-----------------------------------------------------------------------
   
 
   plot(M_chassis_transformed(1,:),M_chassis_transformed(2,:),'red','LineWidth',1);            
   plot(M_right_wheel_transformed(1,:),M_right_wheel_transformed(2,:),'black','LineWidth',1);  
   plot(M_left_Wheel_transformed(1,:),M_left_Wheel_transformed(2,:),'black','LineWidth',1);  
   plot(M_trailer_transformed(1,:),M_trailer_transformed(2,:),'green','LineWidth',1);
end