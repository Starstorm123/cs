t=-5:0.01:5;
fs=1000;
ts=-5:1/fs:5;
f=2;
w=2*pi*f;
z=0;
y=@(t) sin(w.*t);
[u,q]=sdq(y(ts),ts);
for k=1:length(ts)
    z=z+q(k).*sinc(w.*(t-ts(k)));
end

figure(1)
subplot(3,1,1)
plot(t,y(t))
subplot(3,1,2)
plot(ts,q)
subplot(3,1,3)
plot(t,z)

figure(2)
plot(t,abs(z-y(t)))

figure(3)

plot(t,y(t))
hold on;

plot(t,z)

figure(4)


subplot(3,1,1)
plot(t,abs(fftshift(fft(y(t)))))
subplot(3,1,2)
plot(ts,abs(fftshift(fft(q))))
subplot(3,1,3)
plot(t,abs(fftshift(fft(z))))

function [u,q]=sdq(y,t)
u=zeros(1,length(t));
q=zeros(1,length(t));
u(1)=0.9;
for k=2:length(t)
q(k)=sign(u(k-1)+y(k));
u(k)=u(k-1)+y(k)-q(k);
end
end

