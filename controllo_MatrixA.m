function controllo_MatrixA(A)

if(isempty(A))
    error('Inserire una matrice non vuota')
end
if(~isnumeric(A) || ~isreal(A))
    error('La matrice A di ingresso deve essere una matrice di numeri reali.');
end
if(~ismatrix(A))
    error('A deve essere una matrice');
end
if(issparse(A))
    error('A deve essere piena');
end
if(find(~isfinite(A)))
    error('I valori di A devono essere numeri reali finiti');
end
if(size(A,1)~=size(A,2))
    error('La matrice A di ingresso deve essere quadrata');
end

end