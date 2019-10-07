%% Daniel Hondal
% Project 2: Problem 1
%% Part A: Safe Values of Parameters a,b

L = 2.5 %m
a = 220;
b = 220;
ab_all = zeros(a+1,b+1);
for i = 0:a
    for j = 0:b
        w = @(x,i,j) i+j*sqrt(sinh(x.^2));
        xw = @(x,i,j) x.*(i+j*sqrt(sinh(x.^2)));
        F = integral(@(x) w(x,i,j),0,L);
        d = integral(@(x) xw(x,i,j),0,L)/F;
        if (F*d/L) < 125 && F-(F*d/L)<95
            
            A = [1 1
                 0 1];
             
            B = [F;F*d/L];
            
            R = A\B;
            ab_all(i+1,j+1) = sum(R);
            ab(i+1,j+1) = sum(R);
            
        else
             A = [1 1
                 0 1];
             
            B = [F;F*d/L];
            R = A\B;
            ab_all(i+1,j+1) = sum(R);
        end
    end
end
%% 
% A for loop was created that tested the possible values for a & b, based 
% on inspection the highest possible value for either paremeter would be 220 as 
% the max of R_A &  max of R_B is 95N and 125N, respectively. Thus, the sum of 
% R_A & R_B cannot surpass 220. Solely from looking at the weight function, this 
% can only happen when a = 220 and b = 0.
% 
% From writing code that created 2 matrices -- one with non-allowable values 
% & one without non-allowable values -- it can be seen that a needs to$<math xmlns="http://www.w3.org/1998/Math/MathML" 
% display="inline"><mrow><mtext>?</mtext><mn>0</mn><mo>?</mo><mtext>?</mtext><mi 
% mathvariant="italic">a</mi><mo>?</mo><mn>75</mn><mtext>?</mtext><mtext>?</mtext><mtext>?
% </mtext><mtext>?</mtext><mo>&amp;</mo><mtext>?</mtext><mtext>?</mtext><mtext>?
% </mtext><mn>0</mn><mo>?</mo><mtext>?</mtext><mtext>?</mtext><mi mathvariant="italic">b</mi><mo>?</mo><mn>20</mn></mrow></math>$.
%% Part B: Visual Representation of Allowable Parameters
%%

imagesc(ab)
ylabel('a')
xlabel('b')
title('a = 75 x b= 20')
colorbar
imagesc(ab_all)
ylabel('a')
xlabel('b')
title('a = 220 x b= 220')
colorbar

%% 
% The purple in the 1st colormap are non-acceptable values from which one 
% can ascertain the acceptable range of parameters a and b. Then, in the 2nd color 
% map, one can see the higher values that result from the restricted values.