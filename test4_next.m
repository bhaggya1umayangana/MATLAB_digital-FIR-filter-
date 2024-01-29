fsamp = 4600/(2*pi); %sampling frequency in hz
f_a1=500/(2*pi);    %lower stopband edge frequency in hz
f_p1=1200/(2*pi);   %lower passband edge frequency in hz
f_p2=1700/(2*pi);   %upper passband edge frequency in hz
f_a2=1900/(2*pi);   %upper stopband edge frequency in hz

% order for the kaiser funtion
fcuts = [f_a1 f_p1 f_p2 f_a2]; % frequecy edges 
mags = [0 1 0];                  % amplitude ofthe bandpass filter
devs = [10^-(41/20) 10^-(0.21/20) 10^-(41/20)];  %ripples (passband ripple and stopbandripple) 

% Calculate the order from the parameters using KAISERORD.
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);  %kaiser window
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');% cofficent of the kaiserwindow(bandpass filter)




lenfft = 1024;
fft1 = fft(hh,lenfft);
%freq1 = [0:lenfft-1].*(fsamp/lenfft);
fft2 = fftshift(fft1);
freq2 = (-(lenfft-1)/2:(lenfft-1)/2).*(fsamp/lenfft);


figure(3);
plot(freq2,abs(fft2))
xlabel('frequency');
ylabel('db');
title('"shifted" by fftshift |FFT|')








%{
Ts = mean(diff(hh(:,1)));
Fs = 1/Ts;
Fn = Fs/2;
L = size(hh,1);                              % Signal Length
VACCLv = hh(:,2);                            % Signal Vector
Y = fft(VACCLv)/L;                              % Fourier Transform
Y_SHIFTED = fftshift(Y);                        % Shift
Fv = linspace(-Fn, Fn, size(Y,1));              % * Frequency Vector *
figure
plot(Fv, abs(Y_SHIFTED))
grid
%}


