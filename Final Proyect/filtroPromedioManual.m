function imgFiltrada = filtroPromedioManual(img, tamVentana)
    % FILTROPROMEDIOMANUAL Aplica filtro de media espacial de forma 100% manual.
    
    imgD = im2double(img);
    [filas, columnas, canales] = size(imgD);
    radio = floor(tamVentana / 2);
    imgFiltrada = imgD; % Inicializamos manteniendo bordes originales
    
    for c = 1:canales
        plano = imgD(:,:,c);
        planoOut = plano;
        
        % Recorrido interno para evitar desbordamientos en los bordes extremos
        for i = (1 + radio):(filas - radio)
            for j = (1 + radio):(columnas - radio)
                suma = 0;
                % Ventana deslizante manual de 3x3
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