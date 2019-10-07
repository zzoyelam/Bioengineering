%% Daniel Hondal
% HW 7B: Problem 2

% Matrix A
A = [
    1 7 -1 4
    2 -1 3 -2
    -1 4 0 3
    3 -2 -2 1
    ]
% Matrix B
B = [25;6;14;-45]

% Determining linear independence
size(A)
det(A)
cond(A)

%% Part A: Calculate Temperature of Inner Elements of Plate
Ta = 192;
Tb = 51;
temperatures = prob7B_2(Ta,Tb)

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

%% Part B: Fine-Grained Temperature Distribution

function T = prob7B_2b(Tempa,Tempb)

    A =[3 -1 -1 0
        -1 2 0 -1
        -1 0 2 -1
        0 -1 -1 3]
    
    B = [Tempa
        0
        0
        Tempb]

    T = A\B;
    T =reshape(T,[2,2])
end

numelA = numel(A);
sqA = sqrt(numelA);

% T matrix
Tmat1 = ones(sqA);
Tmat2 = zeros(numelA);

% Search all directions
% Up



for i = 1:sqA  
    for j = 1:sqA
        % Left from Tmat (Small matrix)
        if j-1 > 0
            Tmat2(i,j) = 
        end
        % Right from Tmat (Small matrix)
        if j+1 < sqA+1
            Tmat2()
        end
        % Up from Tmat (Small matrix)
        if i-1 > 0
            Tmat2()
        end
        % Down from Tmat (Small matrix)
        if i+1 < sqA+1
            Tmat2()
        end        
    end
end

