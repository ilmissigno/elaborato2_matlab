function [indice_cond,err,residuo,grafico] = Calcolo_Accuratezza(A,x,b,tipo)
    opt.full=true; opt.sup=false; opt.inf=false;
    indice_cond=0;
    err=0;
    residuo=0;
    if (nargout<4)
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
    %% Per le matrici triangolari inf e sup mi baso sull'errore relativo poichè non si può applicare Wilkinson
    indice_cond = cond(A);
    x_attuale = risolve(A,b,opt);
    err = norm(x-x_attuale)/norm(x);
    %% Per le matrici piene posso applicare Gauss con pivoting parziale virtuale e calcolare il residuo con Wilkinson
    if strcmp(tipo,'full')
        err = norm(x-x_attuale)/norm(x);
        residuo = (norm(b - A*x_attuale)/norm(b));
    end
    %% Creazione di un grafico dell'errore e del residuo
    %se u(a)(indice di condizionamento) è piccolo allora posso stimare errore relativo e residuo perchè sono quasi uguali.
    else
        if(strcmp(tipo,'full'))
            opt.full=true;
            opt.sup=false;
            opt.inf=false;
        for n=1:200
            a=rand(n);
            a=full(a);
            x=2*ones(n,1);
            b=a*x;
            c(n)=cond(a);
            y=risolve(a,b,opt);
            re(n)=norm(a*y-b)/(norm(a)*norm(y));
            er(n)=norm(x-y)/norm(x);
        end
        x=1:200;
        figure('Renderer', 'painters', 'Position', [30 30 1600 600])
        subplot(1,2,1);
        plot(x,log10(c))
        xlabel('Soluzioni')
        ylabel('Indici di condizionamento')
        title('Indice di Condizionamento')
        subplot(1,2,2);
        plot(x,log10(re),'g',x,log10(er),'m')
        xlabel('Soluzioni')
        ylabel('Errore x Residuo')
        title('Confronto Errore Residuo')
        sgtitle('Grafico degli indici di condizionamento, errore e residuo dell''errore')
        else
            warning('Attenzione grafico non possibile. La matrice dev''essere piena');
        end
end
end
