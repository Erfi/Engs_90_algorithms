function crossings = find_zeros2(t, x)

% t and x should be the same length
% TO DO: Fix clean up 

tags = zeros(length(t),1);

for i = 1: length(x)-2
if sign(real(x(i)))~=sign(real(x(i+1)))
    tags(i+1) = 1;
end

number_of_crossings = 0;

for i = 1:length(tags)
    if tags(i) == 1
        number_of_crossings = number_of_crossings + 1;
    end
    
end

crossings = zeros (1, number_of_crossings);
left_to_fill = number_of_crossings - 1;

for i = 1 : length(t)
    if tags(i) == 1
        crossings (number_of_crossings - left_to_fill) = t(i);
        left_to_fill = left_to_fill - 1;
    end
    
end
end