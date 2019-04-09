A = rand(3,3);
b = rand(3,1);
opt.full=true;
opt.sup=false;
opt.inf=false;
x = risolve(A,b,opt)
