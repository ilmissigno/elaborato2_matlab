function x = Gauss_BS_Algorithm(A,b,piv,n,e,n_s)
%% Algoritmo di Gauss + Back Substitution
for k=1:n-1
    r=find(abs(A(piv(1:n),k))==max(abs(A(piv(k+1:n),k))),1);
    %r=r(1,1);
    if abs(A(piv(r),k))>e
        n_s=n_s+1;
        if r ~= k
            piv([r k])=piv([k r]);  % Se il max di colonna non � uno "zero"
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
    else                        % ...altrimenti il sistema � singolare
        error ('Sistema singolare: programma arrestato');
    end
end

% Controllo della singolarit� sull'ultimo elemento diagonale
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




