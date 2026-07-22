function imgBinaria = binarizarManual(imgGris, umbral)
% BINARIZARMANUAL Convierte una imagen en escala de grises a blanco y negro 
% utilizando un umbral proporcionado por el usuario de forma manual.

[filas, columnas] = size(imgGris);
imgBinaria = false(filas, columnas);

for i = 1:filas
    for j = 1:columnas
        if double(imgGris(i, j)) >= umbral
            imgBinaria(i, j) = true;
        else
            imgBinaria(i, j) = false;
        end
    end
end

% Convertir a formato uint8 (0 y 255) para visualización correcta en UIAxes
imgBinaria = uint8(imgBinaria) * 255;
end