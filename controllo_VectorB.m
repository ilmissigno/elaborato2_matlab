function controllo_VectorB(A,b)

if(~isvector(b))
   error('Err:BVector','B deve essere un vettore');
end

if(~isnumeric(b) || ~isreal(b))
       error('Err:BReal','Il vettore B deve essere un vettore di numeri reali');
end


if(find(~isfinite(b)))
  error('Err:BRealFinito','Il vettore B deve essere un vettore di numeri reali finito');
end

if(size(A) ~= length(b))
     error('Err:CoerenzaAeB','Il vettore B deve avere lo stesso numero di righe di A');
end

end