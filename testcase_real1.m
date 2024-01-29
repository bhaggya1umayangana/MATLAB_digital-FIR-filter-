function Hd = testcase_real1
%TESTCASE_REAL1 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and Signal Processing Toolbox 8.4.
% Generated on: 22-Oct-2021 23:21:08

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 732.1127;  % Sampling Frequency

Fstop1 = 79.5775;          % First Stopband Frequency
Fpass1 = 190.9859;         % First Passband Frequency
Fpass2 = 270.5634;         % Second Passband Frequency
Fstop2 = 302.3944;         % Second Stopband Frequency
Dstop1 = 0.0089125093813;  % First Stopband Attenuation
Dpass  = 0.012087982924;   % Passband Ripple
Dstop2 = 0.0089125093813;  % Second Stopband Attenuation
flag   = 'scale';          % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 ...
                             1 0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);

% [EOF]