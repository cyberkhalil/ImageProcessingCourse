function [sum, sub, mult, prod, div] = lab_02_intro_03(array1,array2)

sum = array1+array2;
sub = array1-array2;

mult = array1*array2;
prod = crosspro(array1,array2);% element-wise

div = array1./array2;
end

function prod = crosspro(a1,a2)
prod = a1.*a2;% element-wise
end


