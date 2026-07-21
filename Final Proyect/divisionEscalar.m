 function Q = divisionEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Division Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if C == 0
                            Q(i,j,k) = 255; % Proteccion division por cero
                        else
                            val = P1(i,j,k) / C;
                            if val > 255
                                val = 255;
                            end
                            Q(i,j,k) = val;
                        end
                    end
                end
            end
        end