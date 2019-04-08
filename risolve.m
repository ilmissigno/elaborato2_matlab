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
n = size(A,1); %dimensione matrice A
x=zeros(1,n); %vettore soluzioni
i=1:n;
piv(i)=i; %vettore pivot per riga
n_s = 0; %Contatore scambi righe
e = eps(norm(A)); %valore di condizionamento

%% Controllo Singolarita' Matrice A
if(any(find(abs(diag(A))<e))==1)
    error('A e Singolare');
end

%% Inizio Algoritmo : Verifica valore di struttura opt
if(opt.sup)
    %% Algoritmo di Back Substitution
    if(triu(A)==A)
        x(n)=b(piv(n))/A(piv(n),n);
        i=n-1;
        while i>0
            somma=sum(A(piv(i),i+1:n).*x(i+1:n));
            % Determinazione della i-esima incognita
            x(i)=(b(piv(i))-somma)/A(piv(i),i);
            i=i-1;
        end
    else
        error('La matrice A deve essere triangolare superiore');
    end
elseif(opt.inf)
    %% Algoritmo di Forward Substitution
    if(tril(A)==A)
        x(1,1)=b(1)./A(1,1);
        for i = 2:1:n
            x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)')/A(i,i);
        end
    else
        error('La matrice A deve essere triangolare inferiore');
    end
elseif(opt.full)
    %% Algoritmo di Gauss + Back Substitution
    for k=1:n-1
        r=find(abs(A(piv(1:n),k))==max(abs(A(piv(k+1:n),k))));
        r=r(1,1);
        if abs(A(piv(r),k))>e
            n_s=n_s+1;
            piv([r k])=piv([k r]);  % Se il max di colonna non è uno "zero"
            % scambia, altrimenti...
            
            %  Determinazione dei moltiplicatori e
            %  collocazione di essi nella matrice
            %  triangolare inferiore
            %  (per un risparmio di spazio)
            i=(k+1):n ;
            A(piv(i),k)=A(piv(i),k)/A(piv(k),k);
            
            %  Modifica della matrice attiva
            j=(k+1):n ;
            A(piv(i),j)=A(piv(i),j)-(A(piv(i),k)*A(piv(k),j));
            
            %  Modifica deii termini noti
            b(piv(i))=b(piv(i))-(A(piv(i),k)*b(piv(k)));
            
        else                        % ...altrimenti il sistema è singolare
            error ('Sistema singolare: programma arrestato');
        end
    end
    % Controllo della singolarità sull'ultimo elemento diagonale
    if abs(A(piv(n),n))<=e
        error('Sistema singolare su ultimo passo, Errore nei dati di input!');
    end
    %-------------------
    % Back Substitution
    %-------------------
    x(n)=b(piv(n))/A(piv(n),n);
    i=n-1;
    while i>0
        somma=sum(A(piv(i),i+1:n).*x(i+1:n));
        % Determinazione della i-esima incognita
        x(i)=(b(piv(i))-somma)/A(piv(i),i);
        i=i-1;
    end
    
end
x=x'; % Inversione elementi (trasposta) vettore soluzione
end