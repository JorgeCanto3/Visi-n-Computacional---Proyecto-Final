function imgFiltrada = filtroGaussianoManual(img)
% FILTROGAUSSIANOMANUAL Aplica filtro gaussiano 3x3 de forma manual.

imgD = im2double(img);
[filas, columnas, canales] = size(imgD);
imgFiltrada = zeros(size(imgD));

% Máscara Gaussiana estándar de 3x3 (suma total = 16)
K = [1, 2, 1; 2, 4, 2; 1, 2, 1];

for c = 1:canales
    plano = imgD(:,:,c);
    planoOut = plano;
    for i = 2:(filas - 1)
        for j = 2:(columnas - 1)
            suma = 0;
            for mi = -1:1
                for mj = -1:1
                    peso = K(mi+2, mj+2);
                    suma = suma + (plano(i+mi, j+mj) * peso);
                end
            end
            planoOut(i,j) = suma / 16;
        end
    end
    imgFiltrada(:,:,c) = planoOut;
end

if isa(img, 'uint8')
    imgFiltrada = uint8(imgFiltrada * 255);
end
end