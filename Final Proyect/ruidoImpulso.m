function imgRuido = ruidoImpulso(img, probabilidad)

imgRuido = im2double(img);
[filas, columnas, canales] = size(imgRuido);

for c = 1:canales
    plano = imgRuido(:,:,c);
    matrizProb = rand(filas, columnas);
    plano(matrizProb < probabilidad / 2) = 0;
    plano(matrizProb > (1 - probabilidad / 2)) = 1;
    imgRuido(:,:,c) = plano;
end

if isa(img, 'uint8')
    imgRuido = uint8(imgRuido * 255);
end
end