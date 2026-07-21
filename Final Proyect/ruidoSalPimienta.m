function imgRuido = ruidoSalPimienta(img, densidad)
% RUIDOSALPIMIENTA Agrega ruido de sal y pimienta de forma manual.
% img: Imagen de entrada (grises o color)
% densidad: Porcentaje de píxeles afectados (ej. 0.05 para 5%)

imgRuido = im2double(img);
[filas, columnas, canales] = size(imgRuido);
numPixeles = filas * columnas;
cantidad = round(densidad * numPixeles);

for c = 1:canales
    plano = imgRuido(:,:,c);
    % Sal (valores en 1 / blanco)
    idxSal = randperm(numPixeles, round(cantidad / 2));
    plano(idxSal) = 1;
    % Pimienta (valores en 0 / negro)
    idxPimienta = randperm(numPixeles, round(cantidad / 2));
    plano(idxPimienta) = 0;
    imgRuido(:,:,c) = plano;
end

if isa(img, 'uint8')
    imgRuido = uint8(imgRuido * 255);
end
end