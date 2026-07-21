  function Q = escalar(P1, factor, filas, columnas, canales)
            disp('Aplicando: Escalamiento Manual...');
            nuevas_filas = round(filas * factor);
            nuevas_cols = round(columnas * factor);
            Q = zeros(nuevas_filas, nuevas_cols, canales, 'uint8');

            for k = 1:canales
                for i = 1:nuevas_filas
                    for j = 1:nuevas_cols
                        % Mapeo inverso para encontrar de qué pixel original viene
                        viejo_i = round(i / factor);
                        viejo_j = round(j / factor);

                        % Protecciones para no salirnos de los bordes
                        if viejo_i < 1; viejo_i = 1; end
                        if viejo_i > filas; viejo_i = filas; end
                        if viejo_j < 1; viejo_j = 1; end
                        if viejo_j > columnas; viejo_j = columnas; end

                        Q(i, j, k) = P1(viejo_i, viejo_j, k);
                    end
                end
            end
        end