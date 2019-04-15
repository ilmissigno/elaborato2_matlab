function controllo_StructOpt(opt,A)

if(~isstruct(opt))
    error('Err:optStruct','opt deve essere una struttura');

end

if(~isfield(opt,'sup') || ~isfield(opt,'inf') || ~isfield(opt,'full'))
     error('Err:optCampi','opt deve avere sup inf e full come campi');
end

if(~islogical(opt.sup) || ~islogical(opt.inf) || ~islogical(opt.full))
    error('Err:CampiBooleani','i campi di opt devono assumere valori booleani');
end

if((opt.sup && opt.inf) || (opt.full && opt.inf) || (opt.sup && opt.full))
 error('Err:MutuaEsclusioneCampi','Solo uno dei campi di opt devono assumere true');
end


if(triu(A)==A)
    if(opt.sup == false)
        error('Err:MatriceCoerente','La Matrice deve essere coerente con la tipologia di opt 1');
    end
elseif(tril(A)==A)
    if(opt.inf == false)
       
          error('Err:MatriceCoerente','La Matrice deve essere coerente con la tipologia di opt 2');
    end
else
    if(opt.full == false)
        error('Err:MatriceCoerente','La Matrice deve essere coerente con la tipologia di opt 3');
    end
    
end
end
