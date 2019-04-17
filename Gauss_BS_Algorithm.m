function x = Gauss_BS_Algorithm(A,b,n,e)
%% Algoritmo di Gauss + Back Substitution

for i=1:n
    piv(i)=i;
end

for k=1:n-1
    r=find(abs(A(piv(1:n),k))==max(abs(A(piv(k:n),k))),1);
    %r=r(1,1);
    if abs(A(piv(r),k))>e
     
        if r ~= k
            piv([r k])=piv([k r]);  % Se il max di colonna non è uno "zero"
            % scambia, altrimenti...
        end
        
        %  Determinazione dei moltiplicatori e
        %  collocazione di essi nella matrice
        %  triangolare inferiore
        %  (per un risparmio di spazio)
        for i=(k+1):n
            A(piv(i),k)=A(piv(i),k)/A(piv(k),k);
            
            %  Modifica della matrice attiva
            for j=(k+1):n
                A(piv(i),j)=A(piv(i),j)-(A(piv(i),k)*A(piv(k),j));
            end
            %  Modifica deii termini noti
            b(piv(i))=b(piv(i))-(A(piv(i),k)*b(piv(k)));
        end
    else                        % ...altrimenti il sistema è singolare
        error ('Err:A_Singolare','Sistema singolare: programma arrestato');
    end
end

% Controllo della singolarità sull'ultimo elemento diagonale
if abs(A(piv(n),n))<=e
    error('Err:A_Singolare','Sistema singolare su ultimo passo, Errore nei dati di input!');
end
%-------------------
% Back Substitution
%-------------------
x = BS_Algorithm_For_Gauss(A,b,n,piv);
end




