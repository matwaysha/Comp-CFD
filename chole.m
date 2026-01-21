function f = chole(M, C)

    [n, m] = size(M);
    
    L = zeros(n, n);
    
    for i = 1:n
        % Диагональный элемент
        sum_sq = M(i, i);
        for k = 1:i-1
            sum_sq = sum_sq - L(i, k)^2;
        end
        
        L(i, i) = sqrt(sum_sq);
        
        % Поддиагональные элементы
        for j = i+1:n
            sum_prod = M(j, i);
            for k = 1:i-1
                sum_prod = sum_prod - L(j, k) * L(i, k);
            end
            L(j, i) = sum_prod / L(i, i);
        end
    end
    
    % Решение системы L*y = C (прямая подстановка)
    y = zeros(n, 1);
    for i = 1:n
        sum_val = C(i);
        for j = 1:i-1
            sum_val = sum_val - L(i, j) * y(j);
        end
        y(i) = sum_val / L(i, i);
    end
    
    % Решение системы L'*f = y (обратная подстановка)
    f = zeros(n, 1);
    for i = n:-1:1
        sum_val = y(i);
        for j = i+1:n
            sum_val = sum_val - L(j, i) * f(j);  % L' элемент: L(j,i)
        end
        f(i) = sum_val / L(i, i);
    end
    
   
end