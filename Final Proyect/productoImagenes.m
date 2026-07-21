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