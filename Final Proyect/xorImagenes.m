 function Q = xorImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica XOR (Exclusiva)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Se activa SOLO si un pixel tiene valor y el otro no
                        if (P1(i,j,k) > 0 && P2(i,j,k) == 0) || (P1(i,j,k) == 0 && P2(i,j,k) > 0)
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end