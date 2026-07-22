function imgFiltrada = filtroBilateralManual(img, sigma_d, sigma_r)
% FILTROBILATERALMANUAL Aplica filtro bilateral simplificado de forma manual.
% sigma_d: Desviación estándar espacial
% sigma_r: Desviación estándar de intensidad/rango

imgD = im2double(img);
[filas, columnas, canales] = size(imgD);
imgFiltrada = zeros(size(imgD));

for c = 1:canales
    plano = imgD(:,:,c);
    planoOut = plano;
    for i = 2:(filas - 1)
        for j = 2:(columnas - 1)
            w_total = 0;
            f_total = 0;
            p_central = plano(i,j);

            for mi = -1:1
                for mj = -1:1
                    p_vecino = plano(i+mi, j+mj);

                    % Distancia espacial al cuadrado
                    dist_espacial_sq = mi*mi + mj*mj;
                    % Diferencia de intensidad al cuadrado
                    diff_intensidad_sq = (p_central - p_vecino)^2;

                    % Pesos exponenciales matemáticos puros
                    w_espacio = 2.71828^(-dist_espacial_sq / (2 * sigma_d^2));
                    w_rango = 2.71828^(-diff_intensidad_sq / (2 * sigma_r^2));

                    w = w_espacio * w_rango;
                    f_total = f_total + (p_vecino * w);
                    w_total = w_total + w;
                end
            end
            planoOut(i,j) = f_total / w_total;
        end
    end
    imgFiltrada(:,:,c) = planoOut;
end

if isa(img, 'uint8')
    imgFiltrada = uint8(imgFiltrada * 255);
end
end