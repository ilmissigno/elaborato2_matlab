function controllo_StructOpt(opt)

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

end
