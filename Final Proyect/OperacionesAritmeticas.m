classdef OperacionesAritmeticas
    methods (Static)
        
        % 1. Suma de una imagen con un valor escalar
        function Q = sumaEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Suma Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) + C;
                        if val > 255
                            val = 255; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 2. Suma de dos imagenes
        function Q = sumaImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Suma de Imagenes...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) + P2(i,j,k);
                        if val > 255
                            val = 255; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 3. Resta de un escalar a una imagen
        function Q = restaEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Resta Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) - C;
                        if val < 0
                            val = 0; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 4. Resta de dos imagenes (Valores reales / negativos permitidos)
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
        
        % 5. Resta de dos imagenes (Absolutas)
        function Q = restaImagenesAbsoluta(P1, P2, filas, columnas, canales)
            disp('Aplicando: Resta de Imagenes (Absoluta)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) - P2(i,j,k);
                        % Valor absoluto 
                        if val < 0
                            val = val * -1;
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 6. Producto de una imagen con un valor escalar
        function Q = productoEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Producto Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) * C;
                        if val > 255
                            val = 255; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 7. Producto de dos imagenes (Pixel a Pixel)
        function Q = productoImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Producto de Imagenes (Pixel a Pixel)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) * P2(i,j,k);
                        if val > 255
                            val = 255;
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 8. Division de una imagen entre un valor escalar
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
        
        % 9. Division de dos imagenes (Pixel a Pixel)
        function Q = divisionImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Division de Imagenes (Pixel a Pixel)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if P2(i,j,k) == 0
                            Q(i,j,k) = 255; % Proteccion division por cero
                        else
                            val = P1(i,j,k) / P2(i,j,k);
                            if val > 255
                                val = 255;
                            end
                            Q(i,j,k) = val;
                        end
                    end
                end
            end
        end
        
    end
end