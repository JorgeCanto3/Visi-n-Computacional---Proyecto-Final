
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

%Distancia Euclidiana

%Vecindad
%%

%Practica 3

%Operaciones Aritmeticas
%Operaciones Geométricas
%Operaciones Lógicas

%%

%Practica 4

%%

% Practica5