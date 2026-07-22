classdef OperacionesLogicasCompuestas
    methods (Static)
        
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
        
    end
end