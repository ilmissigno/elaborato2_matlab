function Valuta_Performance(inizio, fine, passo, tipo)
%PERFORMANCE_CALCULATOR Summary of this function goes here
%   Detailed explanation goes here
    warning('off','all');
    tempi_esecuzione = zeros(2,(fine-inizio)/passo);
    j=1;
    dim_input = zeros(1,(fine-inizio)/passo);
    for i=inizio:passo:fine
        A = rand(i); b = rand(i,1); 
        if strcmp(tipo,'inf')
            A = tril(A);
            opt.inf=true;
            opt.sup=false;
            opt.full=false;
        elseif strcmp(tipo,'sup')
            A = triu(A);
            opt.sup=true;
            opt.full=false;
            opt.inf=false;
        elseif strcmp(tipo,'full')
            A=full(A);
            opt.full=true;
            opt.inf=false;
            opt.sup=false;
        end
        f = @() risolve(A,b,opt); % handle to function
        f_ml_Divide = @() A\b;
        tempi_esecuzione(1,j) = timeit(f);
        tempi_esecuzione(2,j) = timeit(f_ml_Divide);
        dim_input(j) = i;
        j = j+1;
    end
    figure('Renderer', 'painters', 'Position', [60 60 768 1024])
    subplot(2,2,[3 4]);
    plot(dim_input,tempi_esecuzione(1,:),dim_input,tempi_esecuzione(2,:))
    title("Risolve vs Mldivide")
    xlabel('Numero di righe di A')
    ylabel('Tempo di esecuzione (s)')
    legend('risolve','mldivide')


    %% Grafico dell'indice di condizionamento e dell'errore
     %% Creazione di un grafico dell'errore e del residuo
    %se u(a)(indice di condizionamento) è piccolo allora posso stimare errore relativo e residuo perchè sono quasi uguali.
  
        if(strcmp( tipo,'full'))
            opt.full=true;
            opt.sup=false;
            opt.inf=false;
        for k=2:200
            A = full(rand(k)); 
            x = 2*ones(k,1);
            b = A*x;
            c(k)=cond(A);
            y=risolve(A,b,opt);
            re(k)=norm(A*y-b)/(norm(A)*norm(y));
            er(k)=norm(x-y)/norm(x);
        end
        x=1:200;
        subplot(2,2,1);
        plot(x,log10(c))
        xlabel('Numero di righe matrice A')
        ylabel('Esponente di 10')
        title('Indice di Condizionamento')
        hold on
        subplot(2,2,2);
        plot(x,log10(re),'g',x,log10(er),'m')
        legend('Residuo','Errore')
        xlabel('Numero di righe matrice A')
        ylabel('Esponente di 10')
        title('Confronto Errore Residuo')
        sgtitle('Grafico degli indici di condizionamento, errore e residuo ')
        else
            warning('Attenzione grafico non possibile. La matrice dev''essere piena');
        end
end

