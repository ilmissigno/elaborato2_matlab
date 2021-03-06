function controllo_StructOpt(opt,A)

if(~isstruct(opt))||(~isfield(opt,'sup') && ~isfield(opt,'inf') && ~isfield(opt,'full'))
    error('Err:optStruct','opt deve essere una struttura dei 3 campi specificati');

end


if(length(fieldnames(opt))>3)
        error('Err:optCampi','opt deve avere sup inf e full come campi');
end

if(~islogical(opt.sup) || ~islogical(opt.inf) || ~islogical(opt.full))
    error('Err:CampiBooleani','i campi di opt devono assumere valori booleani');
end

if((opt.sup && opt.inf) || (opt.full && opt.inf) || (opt.sup && opt.full))
 error('Err:MutuaEsclusioneCampi','Solo uno dei campi di opt devono assumere true');
end


if(istriu(A))
    if(opt.sup == false)
        error('Err:MatriceCoerente','La Matrice deve essere coerente con la tipologia di opt 1');
    end
elseif(istril(A))
    if(opt.inf == false)
       
          error('Err:MatriceCoerente','La Matrice deve essere coerente con la tipologia di opt 2');
    end
else
    if(opt.full == false)
        error('Err:MatriceCoerente','La Matrice deve essere coerente con la tipologia di opt 3');
    end
    
end
end
