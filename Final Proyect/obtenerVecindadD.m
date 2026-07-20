function vecinos = obtenerVecindadD(matriz, x, y)
% Inicializamos el arreglo de 4 posiciones exclusivas para las diagonales (X)
vecinos = [-1, -1, -1, -1];

% Arriba-Izquierda: (x-1, y-1)
try, vecinos(1, 1) = matriz(y - 1, x - 1); catch, end
% Arriba-Derecha: (x+1, y-1)
try, vecinos(1, 2) = matriz(y - 1, x + 1); catch, end
% Abajo-Izquierda: (x-1, y+1)
try, vecinos(1, 3) = matriz(y + 1, x - 1); catch, end
% Abajo-Derecha: (x+1, y+1)
try, vecinos(1, 4) = matriz(y + 1, x + 1); catch, end
end