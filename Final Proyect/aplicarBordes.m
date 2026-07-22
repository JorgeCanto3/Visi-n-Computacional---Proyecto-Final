% Button pushed function: AplicarBordeButton
        function AplicarBordeButtonPushed(app, event)
                % Validar que exista una imagen cargada
                if isempty(app.ImagenOriginal)
                    uialert(app.UIFigure, '¡Carga una imagen primero!', 'Error');
                    return;
                end

                % Asegurarnos de tener la imagen en escala de grises
                if isempty(app.ImagenGris)
                    app.ImagenGris = rgb2gray(app.ImagenOriginal);
                end

                % Leer qué tipo de borde seleccionó el usuario
                tipoBorde = app.DropDownBordes.Value;

                % Aplicar el algoritmo correspondiente
                if strcmp(tipoBorde, 'Sobel')
                    img_borde = edge(app.ImagenGris, 'sobel');
                elseif strcmp(tipoBorde, 'Prewitt')
                    img_borde = edge(app.ImagenGris, 'prewitt');
                elseif strcmp(tipoBorde, 'Canny')
                    img_borde = edge(app.ImagenGris, 'canny');
                elseif strcmp(tipoBorde, 'Roberts')
                    img_borde = edge(app.ImagenGris, 'roberts');
                end

                % Mostrar la imagen binaria resultante en el Axes de Resultados
                imshow(img_borde, 'Parent', app.ImgResultado);

                % Actualizar la etiqueta para cumplir con el requisito de "indicar el tipo"
                app.LabelResultado.Text = sprintf('Mostrando Filtro de Borde: %s', tipoBorde);

        end