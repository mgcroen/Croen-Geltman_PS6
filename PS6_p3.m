%% PS6 problem 3

%solve for gamma*

%parameters
A = 2e-6; %cm^2, A1=A2
Amax = 10^-6; %cm^2
N = 10^5; %N1t=N2t
tau = 10^-6; %cm
k = 1.38e-16; %Boltzmann cst, cm^2*g*s^-2*K^-2
T = 310; %K
KL = 10^-8; %cm^2
L = 2e-6; %cm
kappa = 0.1; %dyn/cm

%inputs
S = 0.5*(L + k*T/(kappa*tau) + sqrt((L + k*T/(kappa*tau))^2+4*k*T/kappa));
KS = KL*exp(-0.5*kappa*(S-L)^2/(k*T));

%solve for gamma*
syms gamma

Xi = gamma/S * exp(-S/tau);
eqn = (N-Xi*Amax/(k*T))^2-Xi*A^2/(k*T*KS);
gammastar = solve(eqn,gamma);
g=double(gammastar);

%determine A for each gamma
%at the critical compressibility, A=Amax
for i = 1:2
    xi = g(i)/S * exp(-S/tau);
    E = A^2*xi/u(k*T*KS);
    A(i) = k*T/(2*xi)*(N+N-sqrt(4*E));
end
