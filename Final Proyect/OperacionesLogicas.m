classdef OperacionesLogicas
    methods (Static)

        % AND entre dos imagenes (Interseccion)
        function Q = andImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica AND (Imagenes)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Si ambos pixeles tienen valor, el resultado es 1 (O Blanco)
                        if P1(i,j,k) > 0 && P2(i,j,k) > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % AND con un valor escalar constante
        function Q = andEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Operacion Logica AND (Escalar)...');
            Q = zeros(filas, columnas, canales, 'logical');

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

        % OR entre dos imagenes (Union)
        function Q = orImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica OR (Imagenes)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Si al menos un pixel tiene valor, el resultado es 1 (Blanco)
                        if P1(i,j,k) > 0 || P2(i,j,k) > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % OR con un valor escalar constante
        function Q = orEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Operacion Logica OR (Escalar)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if P1(i,j,k) > 0 || C > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % NOT de una imagen (Negativo / Inversion de polaridad)
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

    end
end