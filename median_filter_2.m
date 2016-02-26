function y = median_filter_2(x,n,th)
N = numel(x);
y = x;

for i = 2:N-n
    if abs(y(i)) > th*median(y(i:i+n))
        y(i) = y(i-1);
	end
	i
end