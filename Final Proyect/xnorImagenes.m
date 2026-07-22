   function Q = xnorImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica XNOR...');
            Q = zeros(filas, columnas, canales, 'uint8');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Se activa SOLO si ambos pixeles son iguales (ambos > 0 o ambos 0)
                        if (P1(i,j,k) > 0 && P2(i,j,k) > 0) || (P1(i,j,k) == 0 && P2(i,j,k) == 0)
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end
        