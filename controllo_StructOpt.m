function controllo_StructOpt(opt,A)

if(~isstruct(opt))
    error('opt deve essere una struttura');
end

if(~isfield(opt,'sup') || ~isfield(opt,'inf') || ~isfield(opt,'full'))
    error('opt deve avere sup inf e full come campi');
end

if(~islogical(opt.sup) || ~islogical(opt.inf) || ~islogical(opt.full))
    error('i campi di opt devono assumere valori booleani');
end

if((opt.sup && opt.inf) || (opt.full && opt.inf) || (opt.sup && opt.full))
    error('Solo uno dei campi di opt devono assumere true');
end

if(triu(A)==A)
    if(opt.sup == false)
        error('La Matrice deve essere coerente con la tipologia di opt');
    end
elseif(tril(A)==A)
    if(opt.inf == false)
        error('La Matrice deve essere coerente con la tipologia di opt');
    end
else
    if(opt.full == true)
        error('La Matrice deve essere coerente con la tipologia di opt');
    end
    
end
end
