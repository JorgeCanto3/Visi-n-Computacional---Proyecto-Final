       function Q = sumaEscalar(app, P1, C, filas, columnas, canales)
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) + C;
                        if val > 255, val = 255; end
                        Q(i,j,k) = val;
                    end
                end
            end
        end

        