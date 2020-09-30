clear;

pwm_frequency = 10000;
phase_frequency = 10;
V = 15;

% These are for the observer (the actual motor constants are in Simulink)
R = (3/2) * 0.54;
L = (3/2) * 3.752e-4;
psi = 0.1194;
gamma = 1000;

simulation_time_step = 0.000005;

phase_frequency_radians = phase_frequency * 2 * pi;