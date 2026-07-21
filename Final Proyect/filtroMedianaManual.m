function imgFiltrada = filtroMedianaManual(img, tamVentana)
    % FILTROMEDIANAMANUAL Aplica filtro de mediana espacial de forma 100% manual.
    
    imgD = im2double(img);
    [filas, columnas, canales] = size(imgD);
    radio = floor(tamVentana / 2);
    imgFiltrada = imgD; % Inicializamos manteniendo bordes originales
    
    for c = 1:canales
        plano = imgD(:,:,c);
        planoOut = plano;
        
        % Recorrido interno para evitar desbordamientos en los bordes
        for i = (1 + radio):(filas - radio)
            for j = (1 + radio):(columnas - radio)
                % Extraer la vecindad local de forma manual en un vector temporal
                vecindario = zeros(1, tamVentana * tamVentana);
                idx = 1;
                for mi = -radio:radio
                    for mj = -radio:radio
                        vecindario(idx) = plano(i + mi, j + mj);
                        idx = idx + 1;
                    end
                end
                
                % Ordenar los valores de menor a mayor (para encontrar la mediana)
                vectorOrdenado = sort(vecindario);
                
                % Seleccionar el valor central del vector ordenado
                posMedio = ceil(length(vectorOrdenado) / 2);
                planoOut(i, j) = vectorOrdenado(posMedio);
            end
        end
        imgFiltrada(:,:,c) = planoOut;
    end
    
    if isa(img, 'uint8')
        imgFiltrada = uint8(imgFiltrada * 255);
    end
end