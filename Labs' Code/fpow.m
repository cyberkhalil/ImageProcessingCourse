function [fpow]=fpow(segment)
fpow=sum(segment.^2)/length(segment);