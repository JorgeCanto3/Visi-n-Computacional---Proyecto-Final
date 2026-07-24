function Q = resaltarManual(P1, x_ini, y_ini, ancho, alto)
disp('Aplicando: Resaltar Region Manual...');
[filas, columnas, canales] = size(P1);

x_fin = min(x_ini + ancho - 1, columnas);
y_fin = min(y_ini + alto - 1, filas);

Q = zeros(filas, columnas, canales, class(P1));

for k = 1:canales
    for i = y_ini:y_fin
        for j = x_ini:x_fin
            if i >= 1 && i <= filas && j >= 1 && j <= columnas
                Q(i, j, k) = P1(i, j, k);
            end
        end
    end
end
end