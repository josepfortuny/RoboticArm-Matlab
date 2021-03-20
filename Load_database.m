choise = 5;
waitfor(GUI_Classify)
switch choise
    %%Se cargan las variables de los programas realizados como:
    %%carga de posición
    case 1
        evalin('base',['load(''' 'C:\Users\tatxo\Documents\MATLAB\Data\net_position' ''')'])
        state_positions = {'0 Graus, Sense pes';'30 Graus, Sense pes';'60 Graus, Sense pes';'90 Graus, Sense pes';'0 Graus, pes';'30 Graus, pes';'60 Graus, pes'; '90 Graus, pes'};
        length_state = length(state_positions);
        state = categorical(state_positions);
        %%carga de recorrido
    case 2
        evalin('base',['load(''' 'C:\Users\tatxo\Documents\MATLAB\Data\net_recorregut' ''')'])
        state_positions = {'0-45 graus , PUJADA, sense pes';'0-45 graus, PUJADA, amb pes';'45-90 graus, PUJADA, sense pes';'45-90 graus, PUJADA, amb pes';'90-45 graus, BAIXADA, sense pes';'90-45 graus, BAIXADA, amb pes';'45-0 graus, BAIXADA, sense pes'; '45-0 graus, BAIXADA, amb pes'};
        length_state = length(state_positions);
        state = categorical(state_positions);
   %%carga del tipo de ejercicio
    case 3
        evalin('base',['load(''' 'C:\Users\tatxo\Documents\MATLAB\Data\net_exercici' ''')'])
        state_positions = {'Peses Biceps';'Flexions';'Peses triceps'};
        length_state = length(state_positions);
        state = categorical(state_positions);
    %%Actual
    case 4 
        %%comprueba si se ha cargado la variable realizada actualmente
        if ~exist('net','var')
            waitfor(GUI_Warning_Classify)
            choise = 0;
        end
end