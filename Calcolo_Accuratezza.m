function [indice_cond,err,residuo,grafico] = Calcolo_Accuratezza(A,x,b,tipo)
    opt.full=false; opt.sup=false; opt.inf=false;
    indice_cond=0;
    err=0;
    residuo=0;
    if (nargout<4)
    if strcmp(tipo,'full')
        opt.full = true;
    elseif strcmp(tipo,'inf')
        opt.inf = true;
    elseif strcmp(tipo,'sup')
        opt.sup = true;
    else
        error("Tipo matrice non valido");
    end
    %% Per le matrici triangolari inf e sup mi baso sull'indice di condizionamento poichè non si può applicare Wilkinson
    indice_cond = cond(A);
    x_attuale = risolve(A,b,opt);
    err = norm(x-x_attuale)/norm(x);
    %% Per le matrici piene posso applicare Gauss con pivoting parziale virtuale e calcolare il residuo con Wilkinson
    if strcmp(tipo,'full')
        residuo = (norm(b - A*x_attuale)/norm(b));
    end
    %% Creazione di un grafico dell'errore e del residuo
    else
        if(strcmp(tipo,'full'))
        for n=1:200
            a=rand(n);
            x=2*ones(n,1);
            b=a*x;
            c(n)=cond(a);
            y=risolve(a,b,opt);
            re(n)=norm(a*y-b)/(norm(a)*norm(y));
            er(n)=norm(y-x)/norm(x);
        end
        x=1:200;
        h=1:200;
        p=1:200;
        figure(1)
        plot(x,log10(c))
        figure(2)
        hold on
        plot(h,log10(re),'g')
        plot(p,log10(er),'r');
        else
            warning('Attenzione grafico non possibile. La matrice dev''essere piena');
        end
end

