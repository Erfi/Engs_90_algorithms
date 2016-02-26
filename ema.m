function y = ema(x,alpha)

y = zeros(size(x));
y(1) = x(1);

for i = 2:numel(x)
   y(i) = alpha*x(i) + (1-alpha)*x(i-1);
end