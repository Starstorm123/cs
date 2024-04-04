echo on
N=1000;
M=75;
Rx_av=zeros(1,M+ 1 );
Sx_av=zeros(1,M+ 1);
for j=1:10, % Take the ensemble average over ten realizations
end;
X=rand(1,N)-1/2; % N i.i.d. uniformly distributed random variables
% between -112 and 112.
Rx=Rx_est(X,M); % autocorrelation of the realization
Sx=fftshift(abs(fft(Rx))); % power spectrum of the realization
Rx_av=Rx_av+Rx;
Sx_av=Sx_av+Sx;
echo off ;
% sum of the autocorrelations
% sum of the spectrums
echo on ;
Rx_av=Rx_av/10;
Sx_av=Sx_av/10;
% Plot Ensemble Average Spectrum
figure;
subplot(2, 1, 1);
plot(Sx_av);
title('Ensemble Average Spectrum');
xlabel('Frequency');
ylabel('Magnitude');
% Plot Ensemble Average Autocorrelation
subplot(2, 1, 2);
plot(Rx_av);
title('Ensemble Average Autocorrelation');
xlabel('Lag');
ylabel('Autocorrelation');
% Plot FFT of Ensemble Average Spectrum
figure;
subplot(2, 1, 1);
Sxy = fftshift(abs(fft(Sx_av)));
plot(Sxy);
title('FFT of Ensemble Average Spectrum');
xlabel('Frequency');
ylabel('Magnitude');
% Plot FFT of Autocorrelation
subplot(2, 1, 2);
xy = fftshift(abs(fft(Rx_av)));
plot(xy);
title('FFT of Ensemble Average Autocorrelation');
xlabel('Frequency');
ylabel('Magnitude');
% ensemble average autocorrelation
% ensemble average spectrum
function[Rx] = Rx_est(X,M)
N = 1000;
Rx = zeros(1,M+1);
for m=1:M+1
 for n=1:N-m+1
 Rx(m) = Rx(m) + X(n)*X(n+m-1);
 end
 Rx(m) = Rx(m)/(N-m+1);
end
end