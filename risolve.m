function x = risolve(A,b,opt)

switch nargin
    case 0
        error('Inserire i parametri A,b e opt');
    case 1
        error('Inserire assieme alla matrice anche il vettore b e la struttura opt');
    case 2
        error('Inserire anche opt');
end

controllo_MatrixA(A);
controllo_VectorB(A,b);
controllo_StructOpt(opt);
%% Inizializzazione Variabili
[n,x,piv,n_s,e] = init_Var(A);
%% Controllo Singolarita' Matrice A
if(any(find(abs(diag(A))<e))==1)
    error('A e Singolare');
end

%% Inizio Algoritmo : Verifica valore di struttura opt
if(opt.sup)
    x = BS_Algorithm(A,b,n,piv);
elseif(opt.inf)
    x = FS_Algorithm(A,b,n);
elseif(opt.full)
    if(tril(A)==A)
        error('La matrice deve essere piena per trovare la soluzione con l''algoritmo di Gauss');
    elseif(triu(A)==A)
        error('La matrice deve essere piena per trovare la soluzione con l''algoritmo di Gauss');
    else
        x = Gauss_BS_Algorithm(A,b,piv,n,e,n_s);
    end
end
x=x'; % Inversione elementi (trasposta) vettore soluzione
end



