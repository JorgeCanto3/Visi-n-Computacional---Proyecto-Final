function imgRuido = ruidoUniforme(img, a, b)
% RUIDOUNIFORME Agrega ruido uniforme aditivo de forma manual.
% a, b: Límites inferior y superior del ruido

imgD = im2double(img);
ruido = a + (b - a) * rand(size(imgD));
imgRuido = imgD + ruido;

imgRuido = max(0, min(1, imgRuido));

if isa(img, 'uint8')
    imgRuido = uint8(imgRuido * 255);
end
end