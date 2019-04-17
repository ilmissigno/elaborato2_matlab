function x = BS_Algorithm(A,b,n)



    x(n,1)=b(n)./A(n,n);
    for i = n-1:-1:1
        x(i,1) = (b(i)-A(i,i+1:n)*x(i+1:n,1))/A(i,i);
    end

end
