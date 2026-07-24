function Q = recortarManual(P1, x_ini, y_ini, ancho, alto)
disp('Aplicando: Recorte Manual...');
[filas, columnas, canales] = size(P1);

x_fin = min(x_ini + ancho - 1, columnas);
y_fin = min(y_ini + alto - 1, filas);

nuevo_ancho = x_fin - x_ini + 1;
nuevo_alto = y_fin - y_ini + 1;

Q = zeros(nuevo_alto, nuevo_ancho, canales, class(P1));

for k = 1:canales
    for i = 1:nuevo_alto
        for j = 1:nuevo_ancho
            orig_y = y_ini + i - 1;
            orig_x = x_ini + j - 1;

            Q(i, j, k) = P1(orig_y, orig_x, k);
        end
    end
end
end