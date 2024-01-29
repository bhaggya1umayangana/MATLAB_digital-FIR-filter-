fs = 8000;
[n,Wn,beta,ftype] = kaiserord([1500 2000],[1 0],...
    [0.01 0.1],fs);
b = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

c = kaiserord([1500 2000],[1 0],[0.01 0.1],fs,'cell');
bcell = fir1(c{:});

hfvt = fvtool(b,1,'Fs',fs);
legend(hfvt)