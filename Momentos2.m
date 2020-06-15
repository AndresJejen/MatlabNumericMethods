% Ejercicio 15.15
% Emple el método de momentos en la elaboración de un programa para
% determinar la capacitancia de dos alambres conductores paralelos
% identicos, separados por una distancia y0 y desplazados por x0, como se
% muestra en la figura. Si cada alambre es de longitud L y radio a, halle
% la capacitancia en los casos
% x0 = 0, 0.2, 0.4, ... ,1.0 m
% Adopte
% y0 = 0.5m
% L = 1m
% a = 1mm
% epsilon_r = 1
% N = 10

% USING THE METHOD OD MOMENT
% THIS PROGRAM DETERMINES THE CAPACITANCE OF A
% PARALLEL-PLATE CAPACITOR CONSISTING OF TWO CONDUCTING
% PLATES, EACH OF DIMENSION AA x BB, SEPARATED BY A 
% DISTANCE D, AND MAINTAINED AT 1 VOLT AND -1 VOLT.

% ONE PLATE IS LOCATED ON THE Z = 0 PLANE WHILE THE OTHER
% IS LOCATED ON THE Z-D PLANE

% ALL DIMENSION ATE IN S.I UNITS
% N IS THE NUMBER IS SUBSECTIONS INTO WHICH EACH PLATE IS DIVIDED

% FIRST, SPEIFY THE PARAMETERS

ER = 1.0;
EO = 8.8541e-12;
AA = 1.0;
BB = 1.0;
D = 1.0;
N = 9;
NT = 2*N;
M = sqrt(N);
DX = AA/M;
DY = BB/M;
DL = DX;

% SECOND, CALCULATE THE ELEMENTS OF THE COEFFICIENT
% MATRIX A
K = 0;
for K1=1:2
    for K2=1:M
        for K3=1:M
            K = K+1;
            X(K) = DX*(K2-0.5);
            Y(K) = DY*(K3 - 0.5);
        end
    end
end

for K1=1:N
    Z(K1) = 0.0;
    Z(K1+N) = D;
end

for I=1:NT
    for J=1:NT
        if (I==J)
            A(I,J) = DL*0.8814/(pi*EO);
        else
            R = sqrt( (X(I)-X(J))^2 + (Y(I)-Y(J))^2 + (Z(I)-Z(J))^2 );
            A(I,J) = DL^2/(4.*pi*EO*R);
        end
    end
end
% NOW DETERMINE THE MATRIX OF CONSTANT VECTOR B
for K=1:N
    B(K) = 1.0;
    B(K+N) = -1.0;
end

% INVERT A AND CALCULATE RHO CONSISTING
% THE UNKNOWN ELEMENTS
% ALSO CALCULATE THE TOTAL CHARGE Q AND CAPACITANCE C
F = inv(A);
RHO = F*B';
SUM = 0.0;
for I=1:N
    SUM = SUM + RHO(I);
end
Q = SUM*(DL^2);
VO = 2.0;
C = abs(Q)/VO;



