function M = setValuesBelowSurfaceToNaN(M, zgrid, rgrid, z_surface, r_surface, z0, l)
    % M - матрица значений размером Nr x Nz
    % zgrid - вектор координат по Z (Nz точек)
    % rgrid - вектор координат по R (Nr точек, R >= 0)
    % z_surface, r_surface - векторы, задающие поверхность тела
    % z0 - начало тела по Z
    % l - длина тела
    
    % Проверяем размеры
    [Nr, Nz] = size(M);
    if length(rgrid) ~= Nr || length(zgrid) ~= Nz
        error('Размеры M не соответствуют размерам сетки');
    end
    
    % Проверяем, что r_surface >= 0
    if any(r_surface < 0)
        error('r_surface должен содержать неотрицательные значения');
    end
    
    % Интерполируем поверхность тела на сетку zgrid
    % Используем интерполяцию с экстраполяцией нулем (вне тела радиус = 0)
    r_surface_interp = zeros(1, Nz);
    
    % Находим индексы zgrid, которые попадают в диапазон тела [z0, z0+l]
    body_mask = (zgrid >= z0) & (zgrid <= z0 + l);
    
    if any(body_mask)
        % Интерполируем только в пределах тела
        % Используем линейную интерполяцию
        r_surface_interp(body_mask) = interp1(z_surface, r_surface, ...
            zgrid(body_mask), 'linear', 0);
        
        % Для безопасности: если интерполяция дала NaN, заменяем на 0
        r_surface_interp(isnan(r_surface_interp)) = 0;
    end
    
    % Создаем матрицу интерполированных радиусов поверхности
    % Размер: Nr x Nz (каждая строка - свой r, каждый столбец - свой z)
    R_surface_mat = repmat(r_surface_interp, Nr, 1);
    
    % Создаем матрицу координат R (каждая строка соответствует своему r)
    R_mat = repmat(rgrid(:), 1, Nz);
    
    % Создаем матрицу маски тела правильного размера
    body_mask_mat = repmat(body_mask, Nr, 1);
    
    % Находим ячейки, которые находятся ниже поверхности тела
    % "Ниже" означает меньший радиус при том же z
    % т.е. r < r_surface(z) и z в пределах тела
    below_surface_mask = (R_mat < R_surface_mat) & body_mask_mat;
    
    % Заменяем значения в этих ячейках на NaN
    M(below_surface_mask) = NaN;
    
    % Визуализация для проверки (опционально)
    % visualizeResults(M, zgrid, rgrid, z_surface, r_surface, z0, l, below_surface_mask);
end