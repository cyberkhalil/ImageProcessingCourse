function [amdf]=amdf(segment)
amdf=sum(abs(segment))/length(segment);