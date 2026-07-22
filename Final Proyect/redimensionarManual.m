function imgRedimensionada = redimensionarManual(imgOriginal, altoDeseado, anchoDeseado)
% Redimensionamiento 100% manual por interpolación del Vecino Más Cercano
[altoOrig, anchoOrig, canales] = size(imgOriginal);
imgRedimensionada = zeros(altoDeseado, anchoDeseado, canales, 'uint8');

% Proporciones de escala
escalaY = altoOrig / altoDeseado;
escalaX = anchoOrig / anchoDeseado;

for c = 1:canales
    for i = 1:altoDeseado
        for j = 1:anchoDeseado
            % Mapeo inverso a la imagen original
            origY = round(i * escalaY);
            origX = round(j * escalaX);

            % Limitar bordes por si el redondeo se pasa
            origY = max(1, min(origY, altoOrig));
            origX = max(1, min(origX, anchoOrig));

            imgRedimensionada(i, j, c) = imgOriginal(origY, origX, c);
        end
    end
end
end