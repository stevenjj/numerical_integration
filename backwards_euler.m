% Short example of using backwards euler integration with the Newton-Rhapson
% Derivative of f is first-order approximated

t_max = 2*pi;
t = [0:1e-2:t_max];

% Diff Equation to integrate
f = @(t,y) -2.3*y; % y' = -2.3y
% Exact solution
f_exact = @(t_in) exp(-2.3*t_in);
y2 = f_exact(t);

% Approximate y(t) with Numerical Integration
% Perform numerical integration
dt = 0.8; % Integration time
tp = [0:dt:t_max];
y3 = zeros(1, size(tp,2));
y4 = zeros(1, size(tp,2));
yexact = zeros(1, size(tp,2));

y3(1) = y2(1);
y4(1) = y2(1);
for i = 2:size(tp,2)
    % Forward Euler Integration
    dy = f(tp(i-1), y3(i-1));
    y3(i) = y3(i-1) + dy*dt;
    
    % Backwards Euler with Newton-Rhapson and Secant Method.
    iters = 100;
    epsilon = 1e-6;
    y4(i) = newton_rhapson_integrate(f, tp(i-1), y4(i-1), dt, iters, epsilon);
    
    % Exact
    yexact(i) = f_exact(tp(i));
end

subplot(1,2 ,1)
hold on
title("y' = -2.3y; Euler dt = " + dt)
plot(tp, y3, 's-');
plot(tp, y4, 'x-');
plot(t, y2, 'LineWidth', 2);
ylim([-1.5*max(y2), 1.5*max(y2)]);
xlabel('t');
ylabel('y(t)');
legend('explicit euler (forward)', 'implicit euler (backward)', 'exact')

subplot(1,2 ,2)
hold on
title('absolute error')
plot(tp, abs(yexact - y3))
plot(tp, abs(yexact - y4))
xlabel('t');
ylabel('y exact - y euler');
legend('explicit euler (forward)', 'implicit euler (backward)')

