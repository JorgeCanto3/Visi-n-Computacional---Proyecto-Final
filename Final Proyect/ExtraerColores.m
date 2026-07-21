function [R, G, B] = ExtraerColores(app, img, y, x)
            R = zeros(y, x, 3, 'uint8'); 
            G = zeros(y, x, 3, 'uint8');
            B = zeros(y, x, 3, 'uint8');
            for i = 1:y
                for j = 1:x
                    R(i, j, 1) = img(i, j, 1);
                    R(i, j, 2) = img(i, j, 1);
                    R(i, j, 3) = img(i, j, 1);
                    G(i, j, 1) = img(i, j, 2);
                    G(i, j, 2) = img(i, j, 2);
                    G(i, j, 3) = img(i, j, 2);
                    B(i, j, 1) = img(i, j, 3);
                    B(i, j, 2) = img(i, j, 3);
                    B(i, j, 3) = img(i, j, 3);
                end
            end
        end