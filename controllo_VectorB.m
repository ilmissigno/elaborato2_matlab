function controllo_VectorB(A,b)

if(~isnumeric(b) || ~isreal(b))
    error('Il vettore B deve essere un vettore di numeri reali');
end

if(~isvector(b))
    error('B deve essere un vettore');
end

if(find(~isfinite(b)))
    error('I valori di B devono essere numeri reali finiti');
end

if(size(A,2) ~= length(b))
    error('Il vettore B deve avere lo stesso numero di righe di A');
end

end