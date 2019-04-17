function Valuta_Performance(from, to, periodo_campionamento, matrix_type)
%PERFORMANCE_CALCULATOR Summary of this function goes here
%   Detailed explanation goes here
    warning('off','all');
    exec_times = zeros(2,(to-from)/periodo_campionamento);
    j=1;
    dim_input = zeros(1,(to-from)/periodo_campionamento);
    for i=from:periodo_campionamento:to
        A = rand(i); b = rand(i,1); 
        if strcmp(matrix_type,'inf')
            A = tril(A);
            opt.inf=true;
            opt.sup=false;
            opt.full=false;
        elseif strcmp(matrix_type,'sup')
            A = triu(A);
            opt.sup=true;
            opt.full=false;
            opt.inf=false;
        elseif strcmp(matrix_type,'full')
            A=full(A);
            opt.full=true;
            opt.inf=false;
            opt.sup=false;
        end
        f = @() risolve(A,b,opt); % handle to function
        f_m = @() A\b;
        exec_times(1,j) = timeit(f);
        exec_times(2,j) = timeit(f_m);
        dim_input(j) = i;
        j = j+1;
    end
    plot(dim_input,exec_times(1,:),dim_input,exec_times(2,:))
    title("Performance dell'algoritmo")
    xlabel('Numero di righe di A')
    ylabel('Tempo di esecuzione (s)')
    legend('risolve','mldivide')



    %% Grafico dell'indice di condizionamento e dell'errore
     %% Creazione di un grafico dell'errore e del residuo
    %se u(a)(indice di condizionamento) � piccolo allora posso stimare errore relativo e residuo perch� sono quasi uguali.
  
        if(strcmp( matrix_type,'full'))
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
        figure('Renderer', 'painters', 'Position', [30 30 1600 600])
        subplot(1,2,1);
        plot(x,log10(c))
        xlabel('Soluzioni')
        ylabel('Indici di condizionamento')
        title('Indice di Condizionamento')
        hold on
        subplot(1,2,2);
        plot(x,log10(re),'g',x,log10(er),'m')
        legend('Residuo','Errore')
        xlabel('Soluzioni')
        ylabel('Errore x Residuo')
        title('Confronto Errore Residuo')
        sgtitle('Grafico degli indici di condizionamento, errore e residuo dell''errore')
        else
            warning('Attenzione grafico non possibile. La matrice dev''essere piena');
        end
end

