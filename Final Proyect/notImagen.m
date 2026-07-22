 function Q = notImagen(P1, filas, columnas, canales)
            disp('Aplicando: Operacion Logica NOT (Negativo Fotografico)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1); % Convertimos a double para proteger la resta

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Aplicamos la regla: Sustraer de 255 el valor de entrada
                        Q(i,j,k) = 255 - P1(i,j,k);
                    end
                end
            end
        end