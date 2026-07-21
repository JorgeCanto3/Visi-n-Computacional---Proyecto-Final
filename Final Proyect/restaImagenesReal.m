       function Q = restaImagenesReal(P1, P2, filas, columnas, canales)
            disp('Aplicando: Resta de Imagenes (Real)...');
            % Nota: Se devuelve como 'double' para conservar los signos negativos
            Q = zeros(filas, columnas, canales, 'double');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        Q(i,j,k) = P1(i,j,k) - P2(i,j,k);
                    end
                end
            end
        end