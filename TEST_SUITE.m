classdef TEST_SUITE < matlab.unittest.TestCase
    
    methods(Test)
        
        function TestCase1(testCase)
            %% TEST CONTROLLO OPT
            %Verifica se il campo opt è una struttura 
            
            [A,b,opt] = Richiama_Parametri();
            opt = 'a';
            verifyError(testCase,@()risolve(A,b,opt),'Err:optStruct');
        end
        
        function TestCase2(testCase)
            %% TEST CAMPI STRUTTURA OPT 
            %verifica l'errore nel caso in cui il campo di opt non sia uno tra:
            %inf, sup, full
            
            [A,b,opt] = Richiama_Parametri();
            opt.sparsa=true;
            verifyError(testCase,@()risolve(A,b,opt),'Err:optCampi');
            
            
        end
        
        
        
        function TestCase3(testCase)       
            %% TEST CAMPI OPT NON LOGICI 
            %verifica l'errore nel caso in cui i campi di opt siano non
            %logici
            
            [A,b,opt] = Richiama_Parametri();
            opt.full= "Mario Rossi";
            opt.inf= false;
            opt.sup= false;
            verifyError(testCase,@()risolve(A,b,opt),'Err:CampiBooleani');
            
            
        end
        
        function TestCase4(testCase)
            %% TEST MUTUA ESCLUSIONE CAMPI OPT
            %verifica l'errore nel caso in cui più campi di opt assumono
            %valore true 
            [A,b,opt] = Richiama_Parametri();
            opt.sup = true;
            opt.inf = true; 
            opt.full= false;
            verifyError(testCase,@()risolve(A,b,opt),'Err:MutuaEsclusioneCampi');
        end
        
        function TestCase5(testCase)
            %% TEST MATRICE COERENTE
            %verifica l'errore nel caso in cui la matrice A non è coerente
            %con il campo specificato
            [A,b,opt] = Richiama_Parametri();
            A = triu(A); 
            opt.inf = true;
            opt.full= false;
            opt.sup= false;
            verifyError(testCase,@()risolve(A,b,opt),'Err:MatriceCoerente');
            
            
        end
        
        function TestCase5_1(testCase)
            %% TEST MATRICE COERENTE
            %verifica l'errore nel caso in cui la matrice A non è coerente
            %con il campo specificato
            [A,b,opt] = Richiama_Parametri();
            A = tril(A); 
            opt.sup = true;
            opt.inf= false;
            opt.full= false;
            verifyError(testCase,@()risolve(A,b,opt),'Err:MatriceCoerente');
            
            
        end
        
         function TestCase5_2(testCase)
            %% TEST MATRICE COERENTE
            %verifica l'errore nel caso in cui la matrice A non è coerente
            %con il campo specificato
            [A,b,opt] = Richiama_Parametri();
            A = rand(10); 
            opt.sup = true;
            opt.inf = false;
            opt.full = false;
            verifyError(testCase,@()risolve(A,b,opt),'Err:MatriceCoerente');
            
            
         end
        
        function TestCase6(testCase)
             %% TEST VETTORE B 
            %Verifica l'errore nel caso in cui b non è un vettore
            [A,b,opt] = Richiama_Parametri();
            b = 'a';
            verifyError(testCase,@()risolve(A,b,opt),'Err:BVector');
            
            
        end
        
        
        function TestCase7(testCase)
            %% TEST VETTORE B REALE
            %Verifica l'errore nel caso in cui b non è un vettore reale
            [A,b,opt] = Richiama_Parametri();
            b = [3;4;'a'];
            verifyError(testCase,@()risolve(A,b,opt),'Err:BReal');
            
        end
        function TestCase8(testCase)
            %% TEST VETTORE B REALE FINITO
            %Verifica l'errore nel caso in cui il vettore b non è reale
            %finito
            [A,b,opt] = Richiama_Parametri();
            b = [22;3;inf];
            verifyError(testCase,@()risolve(A,b,opt),'Err:BRealFinito');
            
            
        end
        
        function TestCase9(testCase)
            %% TEST VETTORE B COERENTE CON LA MATRICE A 
            %Verifica l'errore nel caso in cui il vettore b ha un numero di
            %righe diverso dal numero di righe di A
          
            [A,b,opt] = Richiama_Parametri();
            A = rand(4);
            b = [1;2;3];
            verifyError(testCase,@()risolve(A,b,opt),'Err:CoerenzaAeB');
            
        end
        function TestCase10(testCase)
            %% TEST MATRICE A 
            %Verifica l'errore nel caso in cui A non è una matrice
            [A,b,opt] = Richiama_Parametri();
            A= [3 4 5];
            verifyError(testCase,@()risolve(A,b,opt),'Err:A_isMatrix');
            
            
        end
        
        function TestCase11(testCase)
            %% TEST MATRICE A VUOTA
            % Verifica l'errore nel caso in cui la matrice A è vuota 
            [A,b,opt] = Richiama_Parametri();
            A=zeros(3);
            verifyError(testCase,@()risolve(A,b,opt),'Err:EmptyMatrix');
        end
        
        function TestCase13(testCase)
            %% TEST MATRICE A NON NUMERICA 
            %Verifica l'errore nel caso in cui la matrice A non è numerica
            
            [A,b,opt] = Richiama_Parametri();
            A= [3,2; 'a',4];
            verifyError(testCase,@()risolve(A,b,opt), 'Error:Matrix_NotNumeric');
            
        end
        
        function TestCase14(testCase)
            %% TEST MATRICE A NON SPARSA
            %Verifica l'errore nel caso in cui la matrice A è sparsa
            
            [A,b,opt] = Richiama_Parametri();
            A = sparse(A);
            verifyError(testCase,@()risolve(A,b,opt),'Err:Matrix_NotSparse');
            
        end
        
        function TestCase15(testCase)
            %% TEST MATRICE A NON FINITA
            %verifica l'errore nel caso in cui la matrice A non è finita
            [A,b,opt] = Richiama_Parametri();
            A = [2 3; inf 4];
            verifyError(testCase,@()risolve(A,b,opt),'Err:Matrix_NotFinite');
            
        end
        
        
        
        function TestCase16(testCase)
            %% TEST MATRICE A NON QUADRATICA
            %verifica l'errore nel caso in cui la matrice A non è
            %quadratica
            [A,b,opt] = Richiama_Parametri();
            A = [2 3 4; 4 5 3];
           verifyError(testCase,@()risolve(A,b,opt),'Err:Matrix_NotQuadratic');
            
        end
        
        function testFunctionCase18(testCase)
            
            
            [A,b,opt] = Richiama_Parametri();
            A = rand(10);
            A(1,1)=0;
            verifyError(testCase,@()risolve(A,b,opt),'Err:A_Singolare');
    
        end
        
         
        
    end
    
    
end



function [A,b,opt] = Richiama_Parametri()

A = rand(3,3);
%A = tril(A);
b = rand(3,1);
opt.full=true;
opt.sup=false;
opt.inf=false;

end
