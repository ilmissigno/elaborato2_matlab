%% Algoritmo di Forward Substitution
function x = FS_Algorithm(A,b,n)

if any(find(abs(diag(A)) < eps(norm(A)))) ==1
    error('La matrice A è singolare');
end

    x(1,1)=b(1)./A(1,1);
    for i = 2:1:n
        x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)')/A(i,i);
    end

end