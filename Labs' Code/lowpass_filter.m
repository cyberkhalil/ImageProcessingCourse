
function hl = lowpass_filter(b)
hl = (1/(2+b)^2)*[1 b 1; b b^2 b; 1 b 1];


