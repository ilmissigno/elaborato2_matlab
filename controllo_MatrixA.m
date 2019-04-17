function controllo_MatrixA(A)



if(~ismatrix(A))
       error('Err:A_isMatrix','A deve essere una matrice');
end

if(isempty(A))
       error('Err:EmptyMatrix','La matrice A non deve essere vuota');
end
if(~isnumeric(A) || ~isreal(A))
    error('Err:Matrix_NotNumeric','La matrice A deve essere numerica');
end

if(issparse(A))
      error('Err:Matrix_NotSparse','La matrice A non deve essere sparsa');
end
if(find(~isfinite(A)))
      error('Err:Matrix_NotFinite','I valori di A devono essere numeri reali finiti');
end
if(size(A,1)~=size(A,2))
     error('Err:Matrix_NotQuadratic','La matrice A di ingresso deve essere quadrata');
end

end