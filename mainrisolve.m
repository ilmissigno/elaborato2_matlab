A = [1 1; 3 2];
%A = tril(A);
b = [1; 7];
tipo='full'
 if strcmp(tipo,'full')
        opt.full = true;
        opt.sup=false; 
        opt.inf=false;
    elseif strcmp(tipo,'inf')
        opt.inf = true;
        opt.sup=false;
        opt.full=false;
    elseif strcmp(tipo,'sup')
        opt.sup = true;
        opt.inf = false;
           opt.full=false;
    else
        error("Tipo matrice non valido");
    end
x = risolve(A,b,opt)
