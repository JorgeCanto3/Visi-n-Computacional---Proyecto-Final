function [imgEcualizada, H_original, H_ecualizado] = ecualizarAmano(imgGris)
    
    if isfloat(imgGris) && max(imgGris(:)) <= 1.0
        imgGris = uint8(imgGris * 255);
    else
        imgGris = uint8(imgGris);
    end

    [filas, columnas] = size(imgGris);
    totalPixeles = filas * columnas;
    
    % Calculo de histograma
    H_original = zeros(1, 256);
    for i = 1:filas
        for j = 1:columnas
            nivelGris = double(imgGris(i, j)); 
            H_original(nivelGris + 1) = H_original(nivelGris + 1) + 1; 
        end
    end
    
    % Probabilidades
    P = H_original / totalPixeles;
    
    CDF = zeros(1, 256);
    sumaAcumulada = 0;
    for k = 1:256
        sumaAcumulada = sumaAcumulada + P(k);
        CDF(k) = sumaAcumulada;
    end
    
    % Multiplicamos por 255 y redondeamos al entero más cercano
    tablaTraduccion = uint8(round(CDF * 255));
    
    % Nueva Imagen Ecualizada ---
    imgEcualizada = zeros(filas, columnas, 'uint8');
    for i = 1:filas
        for j = 1:columnas
            nivelViejo = double(imgGris(i, j));
            imgEcualizada(i, j) = tablaTraduccion(nivelViejo + 1);
        end
    end
    
    % Histograma Ecualizado
    H_ecualizado = zeros(1, 256);
    for i = 1:filas
        for j = 1:columnas
            nivelNuevo = double(imgEcualizada(i, j));
            H_ecualizado(nivelNuevo + 1) = H_ecualizado(nivelNuevo + 1) + 1;
        end
    end
end