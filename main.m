% --- Initialization ---
clear; clc;
rng(0);  % Fix the random seed for reproducibility

% Parameters
FFT_LEN = 64;
CP_LEN = 16;
CHAN_LEN = 8;
NOISE_VAR_1D = 1e-3;
alpha = 0.125;

% Generate Pilot
PILOT = randi([0 1], FFT_LEN, 1) * 2 - 1;
h = randn(CHAN_LEN,1) + 1i * randn(CHAN_LEN,1);

% Iteration values as per tutor's suggestion
iteration_values = [30, 100, 300, 500, 700, 1000];

% Initialize norm error arrays
norm_err_lms = zeros(size(iteration_values));
norm_err_sd = zeros(size(iteration_values));

% Loop over iteration values
for ii = 1:length(iteration_values)
    Iter = iteration_values(ii);

    % LMS Estimation
    hest_lms = lms(PILOT, h, Iter, alpha, NOISE_VAR_1D);

    % Steepest Descent Estimation
    hest_sd = SD(PILOT, h, Iter, alpha, NOISE_VAR_1D);

    % Calculate Norm Error
    norm_err_lms(ii) = norm(h - hest_lms);
    norm_err_sd(ii) = norm(h - hest_sd);
end

% Plot the results
figure;
plot(iteration_values, norm_err_lms, 'o-', 'LineWidth', 2); hold on;
plot(iteration_values, norm_err_sd, 's-', 'LineWidth', 2);
xlabel('Number of Iterations');
ylabel('Channel Estimation Error (Norm)');
legend('LMS', 'Steepest Descent');
title('Channel Estimation Error vs Iterations');
grid on;

