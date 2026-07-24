function imgRuido = ruidoGaussiano(img, media, varianza)

imgD = im2double(img);
ruido = media + sqrt(varianza) * randn(size(imgD));
imgRuido = imgD + ruido;

imgRuido = max(0, min(1, imgRuido));

if isa(img, 'uint8')
    imgRuido = uint8(imgRuido * 255);
end
end