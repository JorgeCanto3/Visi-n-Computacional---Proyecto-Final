
%%Practica 1

%Tamaño de la imagen 
function [x_size,y_size] = sizeImg(img)
    
    for x = Original(1,1:end,1)
         x_size = x_size+ 1;
    end
    
    
    for y = Original(1:end,1,1)'
       y_size = y_size+1;
    end

end


%Convertir imagen a blanco y negro 
function BN = blancoNegro(imagen,eg,umbral,y,x)
    BN = zeros(y, x); 
    for i = 1:y
        for j = 1:x
            if eg(i,j) <= umbral
                BN(i,j) = 0;
            else
                BN(i,j) = 255;
            end
        end
    end



end

% Obtener imagen a Escala de Grises
function EG = escalaGrises(imagen,y,x)
    EG = zeros(y, x); 

    for i = 1:y
        for j = 1:x
            valorEG = (imagen(i, j, 1) * 0.299) + (imagen(i, j, 2) * 0.587) + (imagen(i, j, 3) * 0.114);
            EG(i, j) = valorEG;
        end
    end

end

% Extraer Colores
function [R,G,B] = ExtraerColores(img,x,y)

    R = zeros(Y_size, X_size, 3, 'uint8'); 
    G = zeros(Y_size, X_size, 3, 'uint8');
    B = zeros(Y_size, X_size, 3, 'uint8');

    % Extracción
    for i = 1:Y_size
        for j = 1:X_size
            R(i, j, 1) = Original(i, j, 1);
            G(i, j, 2) = Original(i, j, 2);
            B(i, j, 3) = Original(i, j, 3);
        end
    end

end
%%

%Pracica 2

%Distancia Ajedrez
function dist = distAjedrez(p, q)
    x = p(1) - q(1);
    if x < 0
        x = x * -1
    end
    y = p(2) - q(2);
 
    if y < 0
        y = y * -1
    end
    dist = max(x, y);    
end

%Distancia Manhattan
function d = distanciaEuclidiana(puntoA, puntoB)
    x = puntoA(1, 1);
    y = puntoA(1, 2);
    
    s = puntoB(1, 1);
    t = puntoB(1, 2);
    
    diferencia_x = x - s;
    diferencia_y = y - t;
    
    cuadrado_x = diferencia_x * diferencia_x;
    cuadrado_y = diferencia_y * diferencia_y;
    
    suma_total = cuadrado_x + cuadrado_y;
    d = suma_total^0.5;
end

%Distancia Euclidiana
function dist = manhattan(p,q)
    x = (p(1) - q(1));
    
    if x < 0
        x = (x * - 1);
    end
    
    y = (p(2) - q(2));
    
    
    if y < 0
        y = (y * - 1);
    end
    
    
    dist = x + y;     
end


%Vecindad
function vecinos = obtenerVecindad8(matriz, x, y)
    % Inicializamos un arreglo manual de 8 posiciones (1 fila, 8 columnas).
    % Llenamos con -1 por defecto. Si al final un valor sigue siendo -1, significa que ese vecino esta fuera del borde de la imagen.
    vecinos = [-1, -1, -1, -1, -1, -1, -1, -1];
    
    % 1. Vecino Izquierda: (x-1, y)
    try
        vecinos(1, 1) = matriz(y, x - 1);
    catch
    end
    
    % 2. Vecino Arriba: (x, y-1)
    try
        vecinos(1, 2) = matriz(y - 1, x);
    catch
    end
    
    % 3. Vecino Derecha: (x+1, y)
    try
        vecinos(1, 3) = matriz(y, x + 1);
    catch
    end
    
    % 4. Vecino Abajo: (x, y+1)
    try
        vecinos(1, 4) = matriz(y + 1, x);
    catch
    end
    
    % 5. Vecino Arriba-Izquierda: (x-1, y-1)
    try
        vecinos(1, 5) = matriz(y - 1, x - 1);
    catch
    end
    
    % 6. Vecino Arriba-Derecha: (x+1, y-1)
    try
        vecinos(1, 6) = matriz(y - 1, x + 1);
    catch
    end
    
    % 7. Vecino Abajo-Izquierda: (x-1, y+1)
    try
        vecinos(1, 7) = matriz(y + 1, x - 1);
    catch
    end
    
    % 8. Vecino Abajo-Derecha: (x+1, y+1)
    try
        vecinos(1, 8) = matriz(y + 1, x + 1);
    catch
    end
end
%%

%Practica 3


function binaria = obtenerByNManual(gimg, filas, columnas, umbral)
% Inicializamos la matriz de salida como tipo lógico (ceros y unos)
binaria = zeros(filas, columnas, 'logical');

% Recorremos la matriz de gris píxel por píxel
for i = 1:filas
    for j = 1:columnas
        % Evaluamos el umbral
        if gimg(i,j) > umbral
            binaria(i,j) = 1; % Blanco
        else
            binaria(i,j) = 0; % Negro
        end
    end
end
end

%Operaciones Aritmeticas
       % 1. Suma de una imagen con un valor escalar
        function Q = sumaEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Suma Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) + C;
                        if val > 255
                            val = 255; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 2. Suma de dos imagenes
        function Q = sumaImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Suma de Imagenes...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) + P2(i,j,k);
                        if val > 255
                            val = 255; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 3. Resta de un escalar a una imagen
        function Q = restaEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Resta Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) - C;
                        if val < 0
                            val = 0; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 4. Resta de dos imagenes (Valores reales / negativos permitidos)
        function Q = restaImagenesReal(P1, P2, filas, columnas, canales)
            disp('Aplicando: Resta de Imagenes (Real)...');
            % Nota: Se devuelve como 'double' para conservar los signos negativos
            Q = zeros(filas, columnas, canales, 'double');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        Q(i,j,k) = P1(i,j,k) - P2(i,j,k);
                    end
                end
            end
        end
        
        % 5. Resta de dos imagenes (Absolutas)
        function Q = restaImagenesAbsoluta(P1, P2, filas, columnas, canales)
            disp('Aplicando: Resta de Imagenes (Absoluta)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) - P2(i,j,k);
                        % Valor absoluto 
                        if val < 0
                            val = val * -1;
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 6. Producto de una imagen con un valor escalar
        function Q = productoEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Producto Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) * C;
                        if val > 255
                            val = 255; 
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 7. Producto de dos imagenes (Pixel a Pixel)
        function Q = productoImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Producto de Imagenes (Pixel a Pixel)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        val = P1(i,j,k) * P2(i,j,k);
                        if val > 255
                            val = 255;
                        end
                        Q(i,j,k) = val;
                    end
                end
            end
        end
        
        % 8. Division de una imagen entre un valor escalar
        function Q = divisionEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Division Escalar...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if C == 0
                            Q(i,j,k) = 255; % Proteccion division por cero
                        else
                            val = P1(i,j,k) / C;
                            if val > 255
                                val = 255;
                            end
                            Q(i,j,k) = val;
                        end
                    end
                end
            end
        end
        
        % 9. Division de dos imagenes (Pixel a Pixel)
        function Q = divisionImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Division de Imagenes (Pixel a Pixel)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1);
            P2 = double(P2);
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if P2(i,j,k) == 0
                            Q(i,j,k) = 255; % Proteccion division por cero
                        else
                            val = P1(i,j,k) / P2(i,j,k);
                            if val > 255
                                val = 255;
                            end
                            Q(i,j,k) = val;
                        end
                    end
                end
            end
        end
        
    end

%Operaciones Geométricas
% 1. Traslación
        function Q = trasladar(P1, deltaX, deltaY, filas, columnas, canales)
            disp('Aplicando: Traslacion Manual...');
            Q = zeros(filas, columnas, canales, 'uint8');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        nuevo_i = i + deltaY;
                        nuevo_j = j + deltaX;

                        % Verificamos que el nuevo pixel no se salga de la imagen
                        if nuevo_i > 0 && nuevo_i <= filas && nuevo_j > 0 && nuevo_j <= columnas
                            Q(nuevo_i, nuevo_j, k) = P1(i, j, k);
                        end
                    end
                end
            end
        end

        % 2. Escalamiento (Interpolación del Vecino Más Cercano)
        function Q = escalar(P1, factor, filas, columnas, canales)
            disp('Aplicando: Escalamiento Manual...');
            nuevas_filas = round(filas * factor);
            nuevas_cols = round(columnas * factor);
            Q = zeros(nuevas_filas, nuevas_cols, canales, 'uint8');

            for k = 1:canales
                for i = 1:nuevas_filas
                    for j = 1:nuevas_cols
                        % Mapeo inverso para encontrar de qué pixel original viene
                        viejo_i = round(i / factor);
                        viejo_j = round(j / factor);

                        % Protecciones para no salirnos de los bordes
                        if viejo_i < 1; viejo_i = 1; end
                        if viejo_i > filas; viejo_i = filas; end
                        if viejo_j < 1; viejo_j = 1; end
                        if viejo_j > columnas; viejo_j = columnas; end

                        Q(i, j, k) = P1(viejo_i, viejo_j, k);
                    end
                end
            end
        end

        % 3. Rotación (Mapeo inverso para evitar huecos negros)
        function Q = rotar(P1, grados, filas, columnas, canales)
            disp('Aplicando: Rotacion Manual...');
            Q = zeros(filas, columnas, canales, 'uint8');

            % Convertimos grados a radianes
            rads = grados * pi / 180;

            % Encontramos el centro de la imagen para rotar sobre él
            centro_x = round(columnas / 2);
            centro_y = round(filas / 2);

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Trasladamos al origen (0,0) imaginario en el centro
                        x = j - centro_x;
                        y = i - centro_y;

                        % Aplicamos matriz de rotación inversa
                        viejo_x = round(x * cos(-rads) - y * sin(-rads)) + centro_x;
                        viejo_y = round(x * sin(-rads) + y * cos(-rads)) + centro_y;

                        % Si el pixel origen existe, lo traemos
                        if viejo_x >= 1 && viejo_x <= columnas && viejo_y >= 1 && viejo_y <= filas
                            Q(i, j, k) = P1(viejo_y, viejo_x, k);
                        end
                    end
                end
            end
        end

    end
%Operaciones Lógicas
 % 1. AND entre dos imagenes (Interseccion)
        function Q = andImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica AND (Imagenes)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Si ambos pixeles tienen valor, el resultado es 1 (O Blanco)
                        if P1(i,j,k) > 0 && P2(i,j,k) > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % 2. AND con un valor escalar constante
        function Q = andEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Operacion Logica AND (Escalar)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if P1(i,j,k) > 0 && C > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % 3. OR entre dos imagenes (Union)
        function Q = orImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica OR (Imagenes)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Si al menos un pixel tiene valor, el resultado es 1 (Blanco)
                        if P1(i,j,k) > 0 || P2(i,j,k) > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % 4. OR con un valor escalar constante
        function Q = orEscalar(P1, C, filas, columnas, canales)
            disp('Aplicando: Operacion Logica OR (Escalar)...');
            Q = zeros(filas, columnas, canales, 'logical');

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        if P1(i,j,k) > 0 || C > 0
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end

        % 5. NOT de una imagen (Negativo / Inversion de polaridad)
        function Q = notImagen(P1, filas, columnas, canales)
            disp('Aplicando: Operacion Logica NOT (Negativo Fotografico)...');
            Q = zeros(filas, columnas, canales, 'uint8');
            P1 = double(P1); % Convertimos a double para proteger la resta

            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Aplicamos la regla: Sustraer de 255 el valor de entrada
                        Q(i,j,k) = 255 - P1(i,j,k);
                    end
                end
            end
        end

%Logicas Compuestas
   % 1. NAND entre dos imagenes (Negacion de AND)
        function Q = nandImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica NAND...');
            Q = zeros(filas, columnas, canales, 'logical');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Es la negacion del AND: si ambos tienen valor, el resultado es 0. 
                        % Cualquier otra combinacion da 1.
                        if P1(i,j,k) > 0 && P2(i,j,k) > 0
                            Q(i,j,k) = 0;
                        else
                            Q(i,j,k) = 1;
                        end
                    end
                end
            end
        end
        
        % 2. NOR entre dos imagenes (Negacion de OR)
        function Q = norImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica NOR...');
            Q = zeros(filas, columnas, canales, 'logical');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Es la negacion del OR: si al menos uno tiene valor, el resultado es 0.
                        % Solo si ambos son 0, el resultado es 1.
                        if P1(i,j,k) > 0 || P2(i,j,k) > 0
                            Q(i,j,k) = 0;
                        else
                            Q(i,j,k) = 1;
                        end
                    end
                end
            end
        end
        
        % 3. XOR entre dos imagenes (OR Exclusivo)
        function Q = xorImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica XOR (Exclusiva)...');
            Q = zeros(filas, columnas, canales, 'logical');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Se activa SOLO si un pixel tiene valor y el otro no
                        if (P1(i,j,k) > 0 && P2(i,j,k) == 0) || (P1(i,j,k) == 0 && P2(i,j,k) > 0)
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end
        
        % 4. XNOR entre dos imagenes (Equivalencia / Negacion de XOR)
        function Q = xnorImagenes(P1, P2, filas, columnas, canales)
            disp('Aplicando: Operacion Logica XNOR...');
            Q = zeros(filas, columnas, canales, 'logical');
            
            for k = 1:canales
                for i = 1:filas
                    for j = 1:columnas
                        % Se activa SOLO si ambos pixeles son iguales (ambos > 0 o ambos 0)
                        if (P1(i,j,k) > 0 && P2(i,j,k) > 0) || (P1(i,j,k) == 0 && P2(i,j,k) == 0)
                            Q(i,j,k) = 1;
                        else
                            Q(i,j,k) = 0;
                        end
                    end
                end
            end
        end
        

%%

%Practica 4

function mascara = extraerMascaraRoja(img, gris)
    % Extraemos el canal rojo y el gris
    R = double(img(:,:,1));
    gris = double(gris);
    
    % Restamos el gris al canal rojo
    rojo = R - gris;
    
    % Todo lo que de negativo a cero
    rojo(rojo < 0) = 0;
    
    % Umbralización
    mascara = rojo > 40; 
    
    % Filtro 
    mascara = medfilt2(double(mascara), [5 5]);
    mascara = logical(mascara);
end

function img_final = aplicarEfectoColor(img_rgb, img_gris, mascara)
    R_out = img_gris;
    G_out = img_gris;
    B_out = img_gris;
    
    % Extraemos los canales de color originales
    R_orig = img_rgb(:,:,1);
    G_orig = img_rgb(:,:,2);
    B_orig = img_rgb(:,:,3);
    
    % SI la mascara es verdadera remplazamos el gris por el color
    R_out(mascara) = R_orig(mascara);
    G_out(mascara) = G_orig(mascara);
    B_out(mascara) = B_orig(mascara);
    
    % Unimos las 3 matrices
    img_final(:, :, 1) = R_out;
    img_final(:, :, 2) = G_out;
    img_final(:, :, 3) = B_out;

end

function [mascara_binaria, img_segmentada] = segmentarUmbralManual(gimg, filas, columnas, umbral)
% Inicializamos las matrices de salida
% La máscara será lógica (0 y 1) y la segmentada será uint8 (0 a 255)
mascara_binaria = zeros(filas, columnas, 'logical');
img_segmentada = zeros(filas, columnas, 'uint8');

% Recorremos la matriz píxel por píxel
for i = 1:filas
    for j = 1:columnas
        % Evaluamos el umbral
        if gimg(i,j) > umbral
            mascara_binaria(i,j) = 1; % Objeto detectado (Blanco en la máscara)
            img_segmentada(i,j) = gimg(i,j); % Conservamos el valor del píxel original
        else
            mascara_binaria(i,j) = 0; % Fondo (Negro en la máscara)
            img_segmentada(i,j) = 0;  % Apagamos el píxel (Fondo negro)
        end
    end
end
end

%%

% Practica5