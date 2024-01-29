
VACCL = [   0            1
        0.125        1.002
         0.25        1.002
        0.375        1.007
          0.5        1.002
        0.625        1.002
         0.75            1
        0.875        1.002
            1        1.005
        1.125        1.005
         1.25        1.005
        1.375        1.002
          1.5        1.002];

Ts = mean(diff(VACCL(:,1)));                    % Sampling Interval
Fs = 1/Ts;                                      % Sampling Frequency
Fn = Fs/2;                                      % Nyquist Frequency
L = size(VACCL,1);                              % Signal Length
VACCLv = VACCL(:,2);                            % Signal Vector
Y = fft(VACCLv)/L;                              % Fourier Transform
Y_SHIFTED = fftshift(Y);                        % Shift
Fv = linspace(-Fn, Fn, size(Y,1));              % * Frequency Vector *
figure
plot(Fv, abs(Y_SHIFTED))
grid