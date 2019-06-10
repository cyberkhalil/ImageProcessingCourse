
function hh = highpass_filter(b)
hl = (1/(2+b)^2)*[1 b 1; b b^2 b; 1 b 1];
hh = [0 0 0; 0 1 0; 0 0 0]-hl;


