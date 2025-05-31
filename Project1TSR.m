%% Total Response
y_tc_calculated  = y_zir_d_calculated + y_zsr_calculated; %total response calculated 
y_tc = ysp_zsr + y_zir_d; % total response with simulations

figure 
plot(tt, y_tc, '-*','LineWidth', 2)
hold on
plot(tt, y_tc_calculated, '--x', 'LineWidth', 2)
legend ('Matlab', 'Hand Calculations')
xlabel('Time[sec]')
ylabel('TOTAL RESPONSE')