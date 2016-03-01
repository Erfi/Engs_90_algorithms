function y = remove_noise(x,th)
N = numel(x);
y = x;

for i = 1: N
	if abs(y(i)) > th
		y(i) = 0;
	end
end