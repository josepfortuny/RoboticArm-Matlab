% se inicializan las variables de entorno
numCaracteristicas = 3;
numHiddenUnits = 100;
numClases = length_state;
miniBatchSize =128;


layers1 = [ ...
    sequenceInputLayer(numCaracteristicas)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClases)
    softmaxLayer
    classificationLayer];
% Especifique las opciones de entrenamiento. Ajuste el solucionador a 'adam'. 
% Entrena para 60 épocas.
% Para evitar que los degradados exploten, establezca el umbral de degradado en 2.
options1 = trainingOptions('adam', ...
    'MaxEpochs',800, ... %numero de bucles que hace de entrenamiento
    'MiniBatchSize',128,...
    'GradientThreshold',1, ... %limite del grandiente par recortatlo
    'Verbose',0, ...%no mostrar probreso en el comand windows
    'Plots','training-progress');%plot progreso
% se ejecuta el algoritmo de entrenamiento propio de matlab
net = trainNetwork(Xtrain,Ytrain,layers1,options1);
