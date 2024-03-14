N=10000;
n=10000;
s=30;

population=exprnd(2,1,N);
sample_mean=zeros(1,n);

for i=1:n
    sample=randsample(population,s,true);
    sample_mean(i)=mean(sample);
end

figure;

subplot(2,1,1);
histogram(population,'Normalization','pdf','EdgeColor','none');
title('Population Distribution');
xlabel('Value');
ylabel('Probability Density');

subplot(2,1,2);
histogram(sample_mean,'Normalization','pdf','EdgeColor','none');
hold on;
title('Distribution of Sample Means');
xlabel('Sample Mean');
ylabel('Probability Density');
legend('Sample Means','Expeted Normal Distribution');

mu_pop=mean(population);
std_pop=std(population);
exp_mean=mu_pop;
exp_std=std_pop/sqrt(s);

x=linspace(min(sample_mean),max(sample_mean),100);
y=normpdf(x,exp_mean,exp_std);
plot(x,y,'r','lineWidth',2);
hold off;