clc; clear all; close all;

%% parameters
% States
syms x_1 x_2 x_3 x_4 x_5 x_6 x_7 x_8 u_1 u_2
% constant parameters
syms k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 eta1 eta2 eta3 Tf l1

%% ODE
x_dot1 = -x_1*u_1/(1000*x_8) - k1*eta1*x_1*x_2;
x_dot2 = (1-x_2)*u_1/(1000*x_8) + k1*eta1*x_1*x_2 - k2*eta2*x_2*x_3;
x_dot3 = -x_3*u_1/(1000*x_8) + k7*eta1*x_1*x_2 - k3*eta2*x_2*x_3 - k6*eta3*x_3*x_4;
x_dot4 = -x_4*u_1/(1000*x_8) + k2*eta2*x_2*x_3 - k4*eta3*x_3*x_4;
x_dot5 = -x_5*u_1/(1000*x_8) + k3*eta2*x_2*x_3;
x_dot6 = -x_6*u_1/(1000*x_8) + k3*eta3*x_3*x_4;
x_dot7 = (Tf - x_7)*u_1/(1000*x_8) + k8*eta1*x_1*x_2 + k9*eta2*x_2*x_3 + k10*eta3*x_3*x_4 - l1*(x_7 - 1000*u_2);
x_dot8 = u_1/1000;

%%
f1x1 = diff(x_dot1,x_1);
f2x1 = diff(x_dot2,x_1);
f3x1 = diff(x_dot3,x_1);
f4x1 = diff(x_dot4,x_1);
f5x1 = diff(x_dot5,x_1);
f6x1 = diff(x_dot6,x_1);
f7x1 = diff(x_dot7,x_1);
f8x1 = diff(x_dot8,x_1);

f1x2 = diff(x_dot1,x_2);
f2x2 = diff(x_dot2,x_2);
f3x2 = diff(x_dot3,x_2);
f4x2 = diff(x_dot4,x_2);
f5x2 = diff(x_dot5,x_2);
f6x2 = diff(x_dot6,x_2);
f7x2 = diff(x_dot7,x_2);
f8x2 = diff(x_dot8,x_2);


f1x3 = diff(x_dot1,x_3);
f2x3 = diff(x_dot2,x_3);
f3x3 = diff(x_dot3,x_3);
f4x3 = diff(x_dot4,x_3);
f5x3 = diff(x_dot5,x_3);
f6x3 = diff(x_dot6,x_3);
f7x3 = diff(x_dot7,x_3);
f8x3 = diff(x_dot8,x_3);


f1x4 = diff(x_dot1,x_4);
f2x4 = diff(x_dot2,x_4);
f3x4 = diff(x_dot3,x_4);
f4x4 = diff(x_dot4,x_4);
f5x4 = diff(x_dot5,x_4);
f6x4 = diff(x_dot6,x_4);
f7x4 = diff(x_dot7,x_4);
f8x4 = diff(x_dot8,x_4);


f1x5 = diff(x_dot1,x_5);
f2x5 = diff(x_dot2,x_5);
f3x5 = diff(x_dot3,x_5);
f4x5 = diff(x_dot4,x_5);
f5x5 = diff(x_dot5,x_5);
f6x5 = diff(x_dot6,x_5);
f7x5 = diff(x_dot7,x_5);
f8x5 = diff(x_dot8,x_5);


f1x6 = diff(x_dot1,x_6);
f2x6 = diff(x_dot2,x_6);
f3x6 = diff(x_dot3,x_6);
f4x6 = diff(x_dot4,x_6);
f5x6 = diff(x_dot5,x_6);
f6x6 = diff(x_dot6,x_6);
f7x6 = diff(x_dot7,x_6);
f8x6 = diff(x_dot8,x_6);


f1x7 = diff(x_dot1,x_7);
f2x7 = diff(x_dot2,x_7);
f3x7 = diff(x_dot3,x_7);
f4x7 = diff(x_dot4,x_7);
f5x7 = diff(x_dot5,x_7);
f6x7 = diff(x_dot6,x_7);
f7x7 = diff(x_dot7,x_7);
f8x7 = diff(x_dot8,x_7);

f1x8 = diff(x_dot1,x_8);
f2x8 = diff(x_dot2,x_8);
f3x8 = diff(x_dot3,x_8);
f4x8 = diff(x_dot4,x_8);
f5x8 = diff(x_dot5,x_8);
f6x8 = diff(x_dot6,x_8);
f7x8 = diff(x_dot7,x_8);
f8x8 = diff(x_dot8,x_8);


Jac1 = [f1x1 f2x1 f3x1 f4x1 f5x1 f6x1 f7x1 f8x3;
       f1x2 f2x2 f3x2 f4x2 f5x2 f6x2 f7x2 f8x3;
       f1x3 f2x3 f3x3 f4x3 f5x3 f6x3 f7x3 f8x3;
       f1x4 f2x4 f3x4 f4x4 f5x4 f6x4 f7x4 f8x4;
       f1x5 f2x5 f3x5 f4x5 f5x5 f6x5 f7x5 f8x5;
       f1x6 f2x6 f3x6 f4x6 f5x6 f6x6 f7x6 f8x6;
       f1x7 f2x7 f3x7 f4x7 f5x7 f6x7 f7x7 f8x7;
       f1x8 f2x8 f3x8 f4x8 f5x8 f6x8 f7x8 f8x8];
   

   
f1u1 = diff(x_dot1,u_1);
f2u1 = diff(x_dot2,u_1);
f3u1 = diff(x_dot3,u_1);
f4u1 = diff(x_dot4,u_1);
f5u1 = diff(x_dot5,u_1);
f6u1 = diff(x_dot6,u_1);
f7u1 = diff(x_dot7,u_1);
f8u1 = diff(x_dot8,u_1);

f1u2 = diff(x_dot1,u_2);
f2u2 = diff(x_dot2,u_2);
f3u2 = diff(x_dot3,u_2);
f4u2 = diff(x_dot4,u_2);
f5u2 = diff(x_dot5,u_2);
f6u2 = diff(x_dot6,u_2);
f7u2 = diff(x_dot7,u_2);
f8u2 = diff(x_dot8,u_2);

Jac2 = [f1u1 f2u1 f3u1 f4u1 f5u1 f6u1 f7u1 f8u1;
        f1u2 f2u2 f3u2 f4u2 f5u2 f6u2 f7u2 f8u2];

 
Jac2(2,:)