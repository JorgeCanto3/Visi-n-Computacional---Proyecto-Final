% distanciaEuclidiana.m
function d = distanciaEuclidiana(puntoA, puntoB)
    x = puntoA(1, 1);
    y = puntoA(1, 2);
    
    s = puntoB(1, 1);
    t = puntoB(1, 2);
    
    diferencia_x = x - s;
    diferencia_y = y - t;
    
    cuadrado_x = diferencia_x * diferencia_x;
    cuadrado_y = diferencia_y * diferencia_y;
    
    suma_total = cuadrado_x + cuadrado_y;
    d = suma_total^0.5;
end