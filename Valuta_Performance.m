function  Valuta_Performance(inizio, fine, passo, tipo)
%PERFORMANCE_CALCULATOR Summary of this function goes here
%   Detailed explanation goes here
    warning off;
    tempi_esecuzione= zeros(2,(fine-inizio)/passo);
    j=1;
    dim_vettore = zeros(1,(fine-inizio)/passo);
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
            opt.full=true;
            opt.sup=false;
            opt.inf=false;
        end
        f = @() risolve(A,b,opt); % handle to function
        f_mlDivide = @() A\b;
        tempi_esecuzione(1,j) = timeit(f);
        tempi_esecuzione(2,j) = timeit(f_mlDivide);
        dim_vettore(j) = i;
        j = j+1;
    end
    plot( dim_vettore,tempi_esecuzione(1,:),dim_vettore,tempi_esecuzione(2,:))
    title("Performance dell'algoritmo")
    xlabel('Numero di righe di A')
    ylabel('Tempo di esecuzione (s)')
    legend('risolve','mldivide')
end

