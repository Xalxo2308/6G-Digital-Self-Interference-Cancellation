function hest = lms(PILOT,hs,Iterations,alpha,NOISE_VAR_1D)
mu=alpha;
x=PILOT;
N=length(x);
% True complex channel (to be estimated)

L=length(hs);
% Generate output using convolution
y_full = conv(conj(hs),x);                  % Full convolution
y_clean = y_full(1:N);                     % Truncate to match input length

% Add complex Gaussian noise
noise_power = NOISE_VAR_1D;
noise = sqrt(noise_power/2) * (randn(N, 1) + 1j * randn(N, 1));
y = y_clean + noise;

% Initialize estimates
h_est = zeros(L, 1);
h_history = zeros(L, N);
error_history = zeros(1, N);               % Track error magnitude
evec=zeros(N,1);
% LMS algorithm (complex)
for iter = 1:Iterations
for n = L:N

    x_vec = x(n:-1:n - L + 1);      % Form input vector (Lx1)
    y_hat = h_est' * x_vec;                % Predicted output
    e = y(n) - y_hat;                      % Instantaneous error
    evec(n)=e;
    h_est = h_est + mu * conj(e) * x_vec;  % LMS update
    h_history(:, n) = h_est;               % Store estimate
    error_history(n) = error_history(n)+abs(e)^2;           % Store error magnitude squared (MSE)
end
end
hest=h_est;
% Plot: Real and Imaginary Parts
% figure(1)
% subplot(2,1,1);
% plot(real(h_history.'), 'LineWidth', 1.3); hold on;
% plot(repmat(real(h_true'), N, 1), '--k', 'LineWidth', 1.2);
% title('Real Part of Channel Estimate');
% xlabel('Iteration'); ylabel('Real(h)');
% grid on; legend('h_0','h_1','h_2','h_3','h_4','True');
% 
% subplot(2,1,2);
% plot(imag(h_history.'), 'LineWidth', 1.3); hold on;
% plot(repmat(imag(h_true'), N, 1), '--k', 'LineWidth', 1.2);
% title('Imaginary Part of Channel Estimate');
% xlabel('Iteration'); ylabel('Imag(h)');
% grid on; legend('h_0','h_1','h_2','h_3','h_4','True');
% figure(2)
% % Plot: Error (MSE)
% 
% plot(10*log10(error_history(1:end)/num_iter), 'LineWidth', 1.5);
% title('Instantaneous Error Power (MSE) in dB');
% xlabel('Iteration'); ylabel('Error (dB)');
% grid on;
end