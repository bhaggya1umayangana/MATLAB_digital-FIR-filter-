fsamp = 4600/(2*pi); %sampling frequency in hz
f_a1=500/(2*pi);    %lower stopband edge frequency in hz
f_p1=1200/(2*pi);   %lower passband edge frequency in hz
f_p2=1700/(2*pi);   %upper passband edge frequency in hz
f_a2=1900/(2*pi);   %upper stopband edge frequency in hz

% order for the kaiser funtion
fcuts = [f_a1 f_p1 f_p2 f_a2]; % frequecy edges 
mags = [0 1 0];                  % amplitude of the bandpass filter
devs = [10^-(41/20) 10^-(0.21/20) 10^-(41/20)];  %ripples (passband ripple and stopbandripple) 

% Calculate the order from the parameters using KAISERORD.
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);  %kaiser window
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');% cofficent of the kaiserwindow(bandpass filter)

figure(1);
impz(hh);  % impluse responce 
grid on;



ddd=fvtool(hh,'Fs',fsamp); %maginitude responce of filter (between -fsamping/2 to fsampling/2)
axis([-fsamp/2 fsamp/2 -90 10 ]);
grid on;


kv=fvtool(hh,'Fs',fsamp);% magintiude responce 0 to fsamp
grid on;

hfvt = fvtool(hh,'Fs',fsamp);        % magnitude responce of the filter of passband area
grid on;
axis([0 fsamp/2 -0.08 +0.08 ]);






%{
[H,f] = freqz(hh,1,1024,fsamp); % magnitude responce of the filter 
figure(2);

plot(f,abs(H)) % plot of the magnitude responce
axis([-fsamp/2 fsamp/2 1 0.05]);
xlabel('frequency(Hz)'); % x axis
ylabel('db');       %y axis
title('magnitude of Digital filter')
grid on;
%}



%{
lenfft = 1024;
fft1 = fft(hh,lenfft); %fourier transformation 
fft2 = fftshift(fft1); % shift the zero frequceny component
freq2 = (-(lenfft-1)/2:(lenfft-1)/2).*(fsamp/lenfft); %arrange the frequeny (-fsamp/2 to fsamp/2)

figure(3);
plot(freq2,abs(fft2)) % plot the -fsamp/2 to fsamp/2 graph
xlabel('frequency');
ylabel('dB');
title('magnitude of Digital filter');
%}



%{
k = length(hh);
X = fft(hh);
f = (0:k-1)*(fsamp/k);     %frequency range
power = abs(X).^2/k;    %power

Y = fftshift(X);
fshift = (-k/2:k/2-1)*(fsamp/k); % zero-centered frequency range
powershift = abs(Y).^2/k;     % zero-centered power
plot(fshift,powershift)
%}

%{
Y_SHIFTED = fftshift(Y);
Fv = linspace(-fsamp/2, fsamp/2, size(Y,1));
figure(3);
plot(Fv, abs(Y_SHIFTED))
grid
%}



