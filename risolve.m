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
controllo_StructOpt(opt,A);
%% Inizializzazione Variabili
[n,x,e] = init_Var(A);
%% Controllo Singolarita' Matrice A
if(any(find(abs(diag(A))<e))==1)
     error('Err:A_Singolare','A deve essere una matrice non singolare');
end

%% Inizio Algoritmo : Verifica valore di struttura opt
if(opt.sup==true)
    x = BS_Algorithm(A,b,n);
elseif(opt.inf==true)
    x = FS_Algorithm(A,b,n);
elseif(opt.full==true)
    x = Gauss_BS_Algorithm(A,b,n,e);
end
x=x'; % Inversione elementi (trasposta) vettore soluzione
 
end




