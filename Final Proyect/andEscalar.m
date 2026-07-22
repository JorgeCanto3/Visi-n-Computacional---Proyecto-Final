 function Q = andEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Operacion Logica AND (Escalar)...');
            Q = zeros(filas, columnas, canales, 'uint8');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if P1(i,j,k) > 0 && C > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end