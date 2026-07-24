function [ImgRed, ImgGreen, ImgBlue] = ExtraerColores(imgOriginal)
    % 1. Calcular dimensiones manualmente
    filas = 0;
    columnas = 0;
    for y = imgOriginal(1:end, 1, 1)'
        filas = filas + 1;
    end
    for x = imgOriginal(1, 1:end, 1)
        columnas = columnas + 1;
    end

    % 2. Preasignar matrices 3D en ceros con formato 'uint8'
    ImgRed   = zeros(filas, columnas, 3, 'uint8');
    ImgGreen = zeros(filas, columnas, 3, 'uint8');
    ImgBlue  = zeros(filas, columnas, 3, 'uint8');
    
    % 3. Rellenar manualmente cada canal
    for i = 1:filas
        for j = 1:columnas
            ImgRed(i, j, 1) = imgOriginal(i, j, 1);
            ImgGreen(i, j, 2) = imgOriginal(i, j, 2);
            ImgBlue(i, j, 3) = imgOriginal(i, j, 3);
        end
    end
end