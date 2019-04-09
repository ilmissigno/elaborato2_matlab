%% Inizializzazione Variabili
function [n,x,piv,n_s,e] = init_Var(A)
n = size(A,1); %dimensione matrice A
x=zeros(1,n); %vettore soluzioni
i=1:n;
piv(i)=i; %vettore pivot per riga
n_s = 0; %Contatore scambi righe
e = eps(norm(A)); %valore di condizionamento
end