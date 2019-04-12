function Valuta_Performance(inizio,fine,passo,tipoMatrice)

warning off;
    vettore_tempi = zeros(2,(fine-inizio)/passo);
    j=1;
    vettore_NRighe = zeros(1,(fine-inizio)/passo);
    for i=inizio:passo:fine
        A = rand(i); b = rand(i,1);  
        if strcmp(tipoMatrice,'inf')
            A = tril(A);
            opt.inf=true;
            opt.sup=false;
             opt.full=false;
        elseif strcmp(tipoMatrice,'sup')
            A = triu(A);
            opt.sup=true;
            opt.inf=false;
             opt.full=false;
        elseif strcmp(tipoMatrice,'full')
            opt.full=true;
            opt.inf=false;
             opt.sup=false;
        end
        f = @() risolve(A,b,opt); 
        f_mlDivide = @() A\b; %MLDivide
        vettore_tempi(1,j) = timeit(f);
        vettore_tempiML(2,j) = timeit(f_mlDivide);
        vettore_NRighe(j) = i;
        j = j+1;
    end
    %plot( vettore_NRighe,vettore_tempi(1,:),'r',vettore_NRighe,vettore_tempiML(1,:),'b')
    %title("Performance Risolve")
    %xlabel('Numero di righe')
   % ylabel('Tempo di esecuzione (s)')
   % legend('risolve','mldivide')
    h = animatedline('MaximumNumPoints',(fine-inizio)/passo);
 axis([0,fine,0,0.005])
a = tic;
for k = inizio:passo:fine
    
    addpoints(h, vettore_NRighe(k), vettore_tempi(k));
    %drawnow limitrate
    b = toc(a); % check timer
    if b > (1)
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end
end
drawnow % draw final frame
end

















