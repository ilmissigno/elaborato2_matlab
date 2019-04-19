function [indice_cond,err,residuo] = Calcolo_Accuratezza(A,x,b,tipo)
    opt.full=true; opt.sup=false; opt.inf=false;
    indice_cond=0;
    err=0;
    residuo=0;
    
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
    %% Per le matrici triangolari inf e sup calcolo l'errore relativo 
    indice_cond = cond(A);
    x_attuale = risolve(A,b,opt);
    err = norm(x-x_attuale)/norm(x);
    %% Per le matrici piene posso applicare Gauss con pivoting parziale virtuale e calcolare il residuo con Wilkinson
    if strcmp(tipo,'full')
        err = norm(x-x_attuale)/norm(x);
        residuo = (norm(b - A*x_attuale)/norm(b));
    end
   
end

