function vecinos = obtenerVecindad4(matriz, x, y)
    % Inicializamos el arreglo de 4 posiciones (Cruz: Arriba, Abajo, Izquierda, Derecha)
    vecinos = [-1, -1, -1, -1];
    
    % Izquierda: (x-1, y)
    try, vecinos(1, 1) = matriz(y, x - 1); catch, end
    % Arriba: (x, y-1)
    try, vecinos(1, 2) = matriz(y - 1, x); catch, end
    % Derecha: (x+1, y)
    try, vecinos(1, 3) = matriz(y, x + 1); catch, end
    % Abajo: (x, y+1)
    try, vecinos(1, 4) = matriz(y + 1, x); catch, end
end