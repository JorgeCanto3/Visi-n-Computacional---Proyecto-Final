    function Q = restaImagenesAbsoluta( P1, P2, filas, columnas, canales)
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1); P2 = double(P2);
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        Q(i,j,k) = abs(P1(i,j,k) - P2(i,j,k));
                    end
                end
            end
        end