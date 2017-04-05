Signal = F(1:308,1:4000);

% Fs = 2400;            % Sampling frequency
% T = 1/Fs;             % Sampling period
% L = size(Signal,2);             % Length of signal
% t = (0:L-1)*T;        % Time vector
% Y = fft(Signal(1,:));
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% plot(f,P1)
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

chan_num = size(Signal,1);
for j = 1:chan_num;
Phase(j,:) = angle(hilbert(Signal(j,
 
