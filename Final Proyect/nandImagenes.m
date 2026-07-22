  function Q = nandImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica NAND...');
            Q = zeros(filas, columnas, canales, 'uint8');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Es la negacion del AND: si ambos tienen valor, el resultado es 0. 
                        % Cualquier otra combinacion da 1.
                        if P1(i,j,k) > 0 && P2(i,j,k) > 0
                            Q(i,j,k) = 0;
                        else
                            Q(i,j,k) = 1;
                        end
                    end
                end
            end
        end