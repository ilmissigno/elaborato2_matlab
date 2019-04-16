%% Inizializzazione Variabili
function [n,x,e] = init_Var(A)
n = size(A,1); %dimensione matrice A
x=zeros(1,n); %vettore soluzioni
e = eps(norm(A)); %valore di condizionamento
end