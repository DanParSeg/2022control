syms s a0 a1 alpham1 alpha0 alpha1

A = [0 1 0;
    -(alpha0+a0) -(alpha1 +a1) alpham1;
    -1 0 0];

simplify(det(s*eye(3)-A))
