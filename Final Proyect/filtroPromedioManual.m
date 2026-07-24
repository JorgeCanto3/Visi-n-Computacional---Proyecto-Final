function imgFiltrada = filtroPromedioManual(img, tamVentana)
    
    imgD = im2double(img);
    [filas, columnas, canales] = size(imgD);
    radio = floor(tamVentana / 2);
    imgFiltrada = imgD; % Inicializamos manteniendo bordes originales
    
    for c = 1:canales
        plano = imgD(:,:,c);
        planoOut = plano;
        
        % Recorrido interno para evitar desbordamientos
        for i = (1 + radio):(filas - radio)
            for j = (1 + radio):(columnas - radio)
                suma = 0;
                for mi = -radio:radio
                    for mj = -radio:radio
                        suma = suma + plano(i + mi, j + mj);
                    end
                end
                planoOut(i, j) = suma / (tamVentana * tamVentana);
            end
        end
        imgFiltrada(:,:,c) = planoOut;
    end
    
    if isa(img, 'uint8')
        imgFiltrada = uint8(imgFiltrada * 255);
    end
end