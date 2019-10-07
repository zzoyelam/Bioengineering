%% Daniel Hondal
% HW 7B: Problem 2
%% Part A: Calculate Temperature of Inner Elements of Plate
Ta = 192;
Tb = 51;
tempA = prob7B_2(Ta,Tb)

%% Part B: Fine-Grained Temperature Distribution
%% Part i
tempB = prob7B_2b(Ta,Tb)
%% Part ii
subplot(2,1,1)
contourf(tempA);
title('4 Inner Elements')
contourcmap('jet', 'Colorbar', 'on');
subplot(2,1,2)
contourf(tempB);
title('16 Inner Elements')
contourcmap('jet', 'Colorbar', 'on');
%%
% 
%  Contour plot of the 4 inner elements appears to be smoother than the 16
%  inner elements. This would be a reasonable result as the contour would
%  become more detailed with more features, or inner elements in this case.
%  
% 
%% Part C
%%
% An increase in the number of inner elements would lead to a more detailed
% temperature profile of the model. However, an increase leads to increased
% demands on computing storage and power, which after a certain number of
% points will lead to diminished returns.
%  
% 
%% Part D
%%
%   One can automate the process by using a function as executed below that
%   goes through each element and looks around its neighboring elements to
%   fill in another matrix. Disregarding the boundaries makes the problem
%   simpler.
% 

%% Functions
function T = prob7B_2(Tempa,Tempb)

    A =[3 -1 -1 0
        -1 2 0 -1
        -1 0 2 -1
        0 -1 -1 3
        ]
    B = [Tempa
        0
        0
        Tempb]

    T = A\B;
    T =reshape(T,[2,2])
end
function T = prob7B_2b(Tempa,Tempb)

    A = 1:16;
    sqA = sqrt(length(A))
    A = transpose(reshape(A,[sqA,sqA]));
    for i = 1:numel(A)
        [j k] = find(A == i);
        tmat(i,:) = checkdir(A,j,k,A(j,k));
    end
    
    B = [Tempa/2;0;0;0;
        Tempa/2;0;0;0
        0;0;0;Tempb/2
        0;0;0;Tempb/2
        ]

    T = tmat\B;
    T =reshape(T,[4,4])
end


 function tmat = checkdir(smallmat,row,col,eqn)
    [m, n] = size(smallmat);
    tmat = zeros(1,numel(smallmat));
    if col == 1 && row == 1 || col == 1 && row == 2
        count = 1;
    elseif col == n && row == m || col== n && row == m-1
        count = 1;
    else
        count = 0;
    end
    if col-1 >= 1
        var = smallmat(row,col-1);
        %Left
        tmat(eqn,var) = -1;
        count = count + 1;
    end
    if col+1 <= n
        var = smallmat(row,col+1);
        %Right
        tmat(eqn,var) = -1;
        count = count + 1;
    end
    if row-1 >= 1
        var = smallmat(row-1,col);
        %Up
        tmat(eqn,var) = -1;
        count = count + 1;
    end
    if row+1 <= m
        var = smallmat(row+1,col);
        %Down
        tmat(eqn,var) = -1;
        count = count + 1;
    end
    tmat(eqn,eqn) = count;
    tmat = tmat(eqn,:);
  
end
