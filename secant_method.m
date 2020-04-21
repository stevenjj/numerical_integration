% Finds the root of f
function [x2] = secant_method(f, x0, x1, iters, epsilon)
x2 = x1;
for i = 1:iters
    diff = (f(x1) - f(x0));
    if abs(diff) <= epsilon
        break;
    else
        x2 = x1 - f(x1) * (x1 - x0) / diff;
    end
end


end

