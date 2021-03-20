function [mitja] = Modular_Filter (a,Av)
     
     if length(a) < Av
         c = 1;
     else
         c = (length(a)- (Av -1));
     end
     
     if ~isempty(a)
         b= a ( c : length(a));
         mitja = mean(b);
     end
end