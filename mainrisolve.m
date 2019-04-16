A = [1 1; 3 2];
%A = tril(A);
b = [1; 7];
opt.full=true;
opt.sup=false;
opt.inf=false;
x = risolve(A,b,opt)
