function x = cholenons(A, b)
   
    A_sym = A' * A;
    b_sym = A' * b;
    
    x = chole(A_sym, b_sym);
end