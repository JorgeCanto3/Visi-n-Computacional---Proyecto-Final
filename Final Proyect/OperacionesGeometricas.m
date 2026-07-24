classdef OperacionesGeometricas
    methods (Static)

        % Traslación
        function Q = trasladar(P1, deltaX, deltaY, filas, columnas, canales)
            disp('Aplicando: Traslacion Manual...');
            Q = zeros(filas, columnas, canales, 'uint8');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        nuevo_i = i + deltaY;
                        nuevo_j = j + deltaX;

                        % Verificamos que el nuevo pixel no se salga de la imagen
                        if nuevo_i > 0 && nuevo_i <= filas && nuevo_j > 0 && nuevo_j <= columnas
                            Q(nuevo_i, nuevo_j, k) = P1(i, j, k);
                        end
                    end
                end
            end
        end

        % Escalamiento (Interpolación del Vecino Más Cercano)
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

        % Rotación 
        function Q = rotar(P1, grados, filas, columnas, canales)
            disp('Aplicando: Rotacion Manual...');
            Q = zeros(filas, columnas, canales, 'uint8');

            % Convertimos grados a radianes
            rads = grados * pi / 180;

            % Encontramos el centro de la imagen para rotar sobre él
            centro_x = round(columnas / 2);
            centro_y = round(filas / 2);

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Trasladamos al origen (0,0) imaginario en el centro
                        x = j - centro_x;
                        y = i - centro_y;

                        % Aplicamos matriz de rotación inversa
                        viejo_x = round(x * cos(-rads) - y * sin(-rads)) + centro_x;
                        viejo_y = round(x * sin(-rads) + y * cos(-rads)) + centro_y;

                        % Si el pixel origen existe, lo traemos
                        if viejo_x >= 1 && viejo_x <= columnas && viejo_y >= 1 && viejo_y <= filas
                            Q(i, j, k) = P1(viejo_y, viejo_x, k);
                        end
                    end
                end
            end
        end

    end
end