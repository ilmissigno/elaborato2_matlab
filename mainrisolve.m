A = rand(3,3);
A = tril(A);
b = rand(3,1);
opt.full=false;
opt.sup=false;
opt.inf=true;
x = risolve(A,b,opt)