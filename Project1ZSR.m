%% Zero State Response 
%Time variable
syms t tau y(t) Dy
% Time Vector
tt = 0:0.5:10;

% Define the input signal x(t) = u(t)
xt = heaviside(t);

% Define the system's differential equation 
Dy = diff(y, 1);
D2y = diff( y, t, 2);
sys = D2y + 4*Dy + 3*y - 4*diff(xt, t); 

% Initial Conditions
cond1_zsr = y(0) == 0;
cond2_zsr = Dy(0) == 1;
conds_zsr = [cond1_zsr,cond2_zsr];

% Impulse response
ht = dsolve(subs(sys, xt, 0), y(0) == 0, Dy(0) == 0);

% differential equation for ZSR
y_n = dsolve(subs(sys, xt, 0), conds_zsr); 


ht = 3 * y_n;
y_zsr = int(subs(xt, tau) * subs(ht, t - tau), tau, 0, t);% Convolution Integral
ysc_zsr = y_zsr * heaviside(t); % ZSR Multiplied by unit step function
ysp_zsr = subs(ysc_zsr, t, tt); %ZSR Evaluated at time vector
%y_zsr_calculated = 1 - exp(-3.*tt); %ZSR Hand Calculations

figure 
plot(tt, ysp_zsr, '-*', 'LineWidth',2)
hold on
%plot(tt, y_zsr_calculated, '--X', 'LineWidth', 2)
legend('Matlab', 'Hand Calculations')
xlabel('Time [sec]')
ylabel('ZSR')

% Impulse Response