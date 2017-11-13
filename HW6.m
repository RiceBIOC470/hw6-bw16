%HW6

% Problem 1. Curve fitting. 
% Part 1. Take 10 x values on the interval 0 < x <= 10 and then create y
% values from the x values by plugging the x values into a third order
% polynomial of your choice. Add random noise to the data by choosing a random number
% in the interval [-D, D]. Start with D = 1. Plot your data in the x-y plane.

x=sort(10*rand(10,1));
i=5*x.^3+2*x.^2+9*x+11+3*rand(10,1);
figure(1);
plot(x,i,'r.','MarkerSize',24);

% Part 2. Fit your data with polynomials from order 1 to 9. Plot the fitted
% polynomials together with the data. 

for i=1:9
polytype=strcat('poly',num2str(i));
linefit=fit(x,i,polytype);
plot(linefit,x,i);
hold on;
end
hold off;

% Part 3. On a separate plot, plot the R^2 and adjusted R^2 as a function
% of the order of the polynomial. 

r_square=zeros(1,9);
r_adjust=zeros(1,9);
for i=1:9
polytype=strcat('poly',num2str(i));
[fitout,fitmetric]=fit(x,i,polytype);
r_square(i)=fitmetric.rsquare;
r_adjust(i)=fitmetric.adjrsquare;
plot(i,r_square(i),'rs'); hold on;
plot(i,r_adjust(i),'bo'); hold on;
end

% Part 4. Repeat parts 1 - 3 for D = 10 and D = 1000. Comment on the
% results. 

%%D=10
x=sort(10*rand(10,1));
i=5*x.^3+2*x.^2+9*x+11+30*rand(10,1);
figure(1);
plot(x,i,'r.','MarkerSize',24);
for i=1:9
polytype=strcat('poly',num2str(i));
linefit=fit(x,i,polytype);
plot(linefit,x,i);
hold on;
end
hold off;
r_square=zeros(1,9);
r_adjust=zeros(1,9);
for i=1:9
polytype=strcat('poly',num2str(i));
[fitout,fitmetric]=fit(x,i,polytype);
r_square(i)=fitmetric.rsquare;
r_adjust(i)=fitmetric.adjrsquare;
plot(i,r_square(i),'rs'); hold on;
plot(i,r_adjust(i),'bo'); hold on;
end

%%D=1000

x=sort(10*rand(10,1));
i=5*x.^3+2*x.^2+9*x+11+3000*rand(10,1);
figure(1);
plot(x,i,'r.','MarkerSize',24);
for i=1:9
polytype=strcat('poly',num2str(i));
linefit=fit(x,i,polytype);
plot(linefit,x,i);
hold on;
end
hold off;
r_square=zeros(1,9);
r_adjust=zeros(1,9);
for i=1:9
polytype=strcat('poly',num2str(i));
[fitout,fitmetric]=fit(x,i,polytype);
r_square(i)=fitmetric.rsquare;
r_adjust(i)=fitmetric.adjrsquare;
plot(i,r_square(i),'rs'); hold on;
plot(i,r_adjust(i),'bo'); hold on;
end

% when noise is larger, it is harder to find a polynomial to fit the data
% and higher order polynomials will fit the data

% Part 5. Now repeat parts 1-3 but take 100 x values on the interval 0 < x <=
% 10. Comment on the results. 

x=sort(10*rand(100,1));
i=5*x.^3+2*x.^2+9*x+11+3*rand(10,1);
figure(1);
plot(x,i,'r.','MarkerSize',24);
for i=1:9
polytype=strcat('poly',num2str(i));
linefit=fit(x,i,polytype);
plot(linefit,x,i);
hold on;
end
hold off;
r_square=zeros(1,9);
r_adjust=zeros(1,9);
for i=1:9
polytype=strcat('poly',num2str(i));
[fitout,fitmetric]=fit(x,i,polytype);
r_square(i)=fitmetric.rsquare;
r_adjust(i)=fitmetric.adjrsquare;
plot(i,r_square(i),'rs'); hold on;
plot(i,r_adjust(i),'bo'); hold on;
end

% taking more points makes the curve smoother and easier to find to
% polynomial to fit the curve.

% Problem 2. Basic statistics. 
%%
% Part 1. Consider two different distributions - Gaussian numbers with a mean of
% 0 and variance 1 and Gaussian numbers with a mean of 1 and variance 1.
% (1) Make a plot of the average p-value for the t-test comparing N random
% numbers chosen from each of these two distributions as a function of N.

for i=1:100
dist1=randn(i,1);
dist2=1+randn(i,1);
[sig,pval]=ttest2(dist1,dist2);
plot(i, pval, 'r.'); hold on;
end
xlabel('size');
ylabel('p value');
hold off;

%%
% Part 2. Now keep the first distribution the same, but vary the mean of
% the second distribution between 0 and 10 with the same variance and
% repeat part one. Make a plot of all of these different curves on the same
% set of axes. What is special about the case where the mean of the second
% distribution is 0? 

avgpval = [];
for i=0:10
for j=1:100
dist_1 = randn(j,1);
dist_2 = randn(j,1)*i;
[is_sig(j),pval(i+1,j)] = ttest2(dist_1,dist_2);
avgpval(j)=sum(is_sig(~isnan(is_sig)))/j;
end
plot((1:100),avgpval)
hold on
end
hold off;

% to increase the mean will decrease the mean of p value.

%%
% Part 3. Now keep the means of the two distributions at 0 and 1 as in part
% 1, but vary the variance of both distributions simultaneiously between 0.1 and 10 and plot the 
% p-values vs the number of numbers drawn as before. Comment on your results.  

avgpval = [];
for i=0.1:1:10
for j=1:100
dist_1=randn(j,1)*i;
dist_2=randn(j,1)*i;
[is_sig(j),avgpval(i*10,j)] = ttest2(dist_1,dist_2);
avgpval(j)=sum(is_sig(~isnan(is_sig)))/j;
end
plot((1:100),avgpval)
hold on
end
hold off;

% more variation was observed. the increasing variance, the higher p values
% and less statistical significance

