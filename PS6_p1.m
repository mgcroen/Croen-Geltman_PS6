%% PS6 problem 1

%% b - plot the nullclines
alpha=10;

%n=1
r=linspace(0,10,200);
u=zeros(2,length(r));
v=u;
u(1,:)=alpha./(1+r);
v(1,:)=alpha./(1+r);

subplot(1,2,1)
hold on
plot(u(1,:),r,'-b')
plot(r,v(1,:),'-g')
title('n=1, \alpha=10')
leg = legend({'$\frac{du}{dt} = 0$', '$\frac{dv}{dt} = 0$'}, 'FontSize', 12);
set(leg ,'Interpreter','latex')

%n=2
u(2,:)=alpha./(1+r.^2);
v(2,:)=alpha./(1+r.^2);

subplot(1,2,2)
hold on
plot(u(2,:),r,'-b')
plot(r,v(2,:),'-g')
title('n=2, \alpha=10')
leg = legend({'$\frac{du}{dt} = 0$', '$\frac{dv}{dt} = 0$'}, 'FontSize', 12);
set(leg ,'Interpreter','latex')


%% c - phase portrait plots with nullclines
% need workspace from previous section
alpha = 10;
k=linspace(0,10,25);

for n=1:2
    for i=1:length(k)
        for j=1:length(k)
            U(j,i)= alpha/(1+k(j)^n)-k(i);
            V(j,i)= alpha/(1+k(i)^n)-k(j);
        end
    end

    subplot(1,2,n)
    hold on
    quiver(k,k,U,V)
    plot(u(n,:),r,'-b')
    plot(r,v(n,:),'-g')
    title(['n=' num2str(n) ', \alpha=10'])
    leg = legend({'phase vectors', '$\frac{du}{dt} = 0$', '$\frac{dv}{dt} = 0$'}, 'FontSize', 12);
    set(leg ,'Interpreter','latex')
    xlim([0 10])
    ylim([0 10])  
    xlabel('u')
    ylabel('v')
    
end






