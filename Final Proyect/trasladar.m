   function Q = trasladar(app, P1, deltaX, deltaY)
            [filas, columnas, canales] = size(P1);
            Q = zeros(filas, columnas, canales, class(P1));
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        n_i = i + deltaY; n_j = j + deltaX;
                        if n_i >= 1 && n_i <= filas && n_j >= 1 && n_j <= columnas
                            Q(n_i, n_j, k) = P1(i, j, k);
                        end
                    end
                end
            end
        end