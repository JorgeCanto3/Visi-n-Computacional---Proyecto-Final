function vecinos = obtenerVecindad8(matriz, x, y)
    % Inicializamos el arreglo de 8 posiciones con -1 por defecto
    vecinos = [-1, -1, -1, -1, -1, -1, -1, -1];
    
    % Izquierda: (x-1, y)
    try, vecinos(1, 1) = matriz(y, x - 1); catch, end
    % Arriba: (x, y-1)
    try, vecinos(1, 2) = matriz(y - 1, x); catch, end
    % Derecha: (x+1, y)
    try, vecinos(1, 3) = matriz(y, x + 1); catch, end
    % Abajo: (x, y+1)
    try, vecinos(1, 4) = matriz(y + 1, x); catch, end
    % Arriba-Izquierda: (x-1, y-1)
    try, vecinos(1, 5) = matriz(y - 1, x - 1); catch, end
    % Arriba-Derecha: (x+1, y-1)
    try, vecinos(1, 6) = matriz(y - 1, x + 1); catch, end
    % Abajo-Izquierda: (x-1, y+1)
    try, vecinos(1, 7) = matriz(y + 1, x - 1); catch, end
    % Abajo-Derecha: (x+1, y+1)
    try, vecinos(1, 8) = matriz(y + 1, x + 1); catch, end
end