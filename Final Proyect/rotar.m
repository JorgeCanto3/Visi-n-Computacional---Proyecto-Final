   function Q = rotar( P1, grados)
            [filas, columnas, canales] = size(P1);
            Q = zeros(filas, columnas, canales, class(P1));
            rads = grados * pi / 180;
            cx = round(columnas / 2); cy = round(filas / 2);
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        x = j - cx; y = i - cy;
                        v_x = round(x * cos(-rads) - y * sin(-rads)) + cx;
                        v_y = round(x * sin(-rads) + y * cos(-rads)) + cy;
                        if v_x >= 1 && v_x <= columnas && v_y >= 1 && v_y <= filas
                            Q(i, j, k) = P1(v_y, v_x, k);
                        end
                    end
                end
            end
        end