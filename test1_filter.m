
fsamp = 8000;
fcuts = [1000 1300 2210 2410];
mags = [0 1 0];
devs = [0.01 0.05 0.01];

[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

 %figure(1);
 %freqz(hh);

 figure(2);
 impz(hh);
   
 [H,f] = freqz(hh,1,1024,fsamp);
 figure(4);
plot(f,abs(H))
xlabel('frequency');
ylabel('db');


 
 
 
 Y=fft(hh);
 Z=fftshift(Y);
 powershift=abs(Y).^2/k;
 fshift = (-4000:4000);
%Zshift=fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');
 plot(powershift,fshift);
 

%X = fft(hh); 
%Y = fftshift(abs(H));
%hhshift = (-4000:2:4000);
%Hshift = abs(Y);% zero-centered frequency range
%figure(3)
%plot(hshift,Y)
grid 



 

