function gris = obtenerGrisManual(img)
% Obtenemos las dimensiones
[filas, columnas, ~] = size(img);

% Inicializamos la matriz en ceros
gris = zeros(filas, columnas, 'uint8'); 

% Recorremos la imagen
for i = 1:filas
    for j = 1:columnas
        % Extraemos cada canal y lo pasamos a double para evitar truncamientos
        R = double(img(i, j, 1));
        G = double(img(i, j, 2));
        B = double(img(i, j, 3));

        % Aplicamos la ecuación
        % $Gris = 0.299R + 0.587G + 0.114B$
        valorEG = (R * 0.299) + (G * 0.587) + (B * 0.114);

        % Guardamos el resultado en la matriz
        gris(i, j) = valorEG;
    end
end
end