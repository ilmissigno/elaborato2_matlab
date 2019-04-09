%% Algoritmo di Back Substitution
function x = BS_Algorithm(A,b,n,piv)
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
end