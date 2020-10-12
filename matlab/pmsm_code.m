clear;

pwm_frequency = 10000;
phase_frequency = 10;
V = 75;

% These are for the observer (the actual motor constants are in Simulink)
R = (3/2) * 0.34;
L = (3/2) * 3.752e-4;
psi = 0.0001194;
gamma = 1000;

simulation_time_step = 0.00001;

phase_frequency_radians = phase_frequency * 2 * pi;