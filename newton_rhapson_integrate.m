function [y_next] = newton_rhapson_integrate(f, t, y, h, iters, epsilon)
% Initial approximation for y_next. Use forward integration
y_approx = y + h*f(t,y);
% Newton equation to solve:
g = @(y_kp1) y_kp1 - y - h*f(t+h, y_kp1);
% Use secant method
y_next = secant_method(g, y, y_approx, iters, epsilon);
end

