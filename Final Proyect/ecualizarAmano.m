function [imgEcualizada, H_original, H_ecualizado] = ecualizarAmano(imgGris)
    
    % --- BARRERA DE SEGURIDAD (CORTAFUEGOS) ---
    % 1. Si la imagen está normalizada entre 0 y 1, la escalamos
    if isfloat(imgGris) && max(imgGris(:)) <= 1.0
        imgGris = uint8(imgGris * 255);
    else
        % 2. Forzamos a que sea entera (redondea y quita decimales molestos)
        imgGris = uint8(imgGris);
    end
    % ------------------------------------------

    [filas, columnas] = size(imgGris);
    totalPixeles = filas * columnas;
    
    % --- PASO 1: Calcular el Histograma Original a mano ---
    H_original = zeros(1, 256);
    for i = 1:filas
        for j = 1:columnas
            % Extraemos como double para el índice, pero ya sabemos que es entero exacto
            nivelGris = double(imgGris(i, j)); 
            H_original(nivelGris + 1) = H_original(nivelGris + 1) + 1; 
        end
    end
    
    % --- PASO 2: Obtener las Probabilidades (P) ---
    P = H_original / totalPixeles;
    
    % --- PASO 3: Acumular Probabilidades (CDF) ---
    CDF = zeros(1, 256);
    sumaAcumulada = 0;
    for k = 1:256
        sumaAcumulada = sumaAcumulada + P(k);
        CDF(k) = sumaAcumulada;
    end
    
    % --- PASO 4: Mapeo / Tabla de traducción ---
    % Multiplicamos por 255 y redondeamos al entero más cercano
    tablaTraduccion = uint8(round(CDF * 255));
    
    % --- PASO 5: Construir la nueva Imagen Ecualizada ---
    imgEcualizada = zeros(filas, columnas, 'uint8');
    for i = 1:filas
        for j = 1:columnas
            nivelViejo = double(imgGris(i, j));
            imgEcualizada(i, j) = tablaTraduccion(nivelViejo + 1);
        end
    end
    
    % --- PASO EXTRA: Calcular el Histograma Ecualizado a mano ---
    H_ecualizado = zeros(1, 256);
    for i = 1:filas
        for j = 1:columnas
            nivelNuevo = double(imgEcualizada(i, j));
            H_ecualizado(nivelNuevo + 1) = H_ecualizado(nivelNuevo + 1) + 1;
        end
    end
end