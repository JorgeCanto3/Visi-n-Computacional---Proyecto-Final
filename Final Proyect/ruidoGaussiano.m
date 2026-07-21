function imgRuido = ruidoGaussiano(img, media, varianza)
% RUIDOGAUSSIANO Agrega ruido gaussiano de forma manual.
% media: Media del ruido (ej. 0)
% varianza: Varianza del ruido (ej. 0.01)

imgD = im2double(img);
ruido = media + sqrt(varianza) * randn(size(imgD));
imgRuido = imgD + ruido;

imgRuido = max(0, min(1, imgRuido));

if isa(img, 'uint8')
    imgRuido = uint8(imgRuido * 255);
end
end