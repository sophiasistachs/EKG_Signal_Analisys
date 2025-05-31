%% Step Response
% Calculating the function using step()
[st, t_step] = step(sys, tt);  % Compute step response over the same time vector

% Plotting the step response
plot(t_step, st, '--o', 'LineWidth', 1)

%% Impulse Response

% Calculating the function using impulse()
num = [4 0];  % Numerator coefficients for s
den = [1 4 3];  % Denominator coefficients for s^2 + 4s + 3
sys = tf(num, den);
[ht, t_impulse] = impulse(sys, tt);  % Compute impulse response over the same time vector

% Plotting the impulse response
plot(t_impulse, ht, '--*', 'LineWidth', 2)