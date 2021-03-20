%inicializamos las variables y constantes necesarias
warning('off','all')
clear connection
%se ha de comprobar si existe la connexion con arduino ya que si existe
% y se vuelve a generar da problemas debido a la composicion de arduino
connection = arduino();
Pin_Servo = 'A0';
Pin_Fuerza = 'A1';
Pin_Biceps = 'A3';
Pin_Triceps = 'A4';
llegenda = ["Servo", "Biceps", "Triceps"];
length_state = 0;
%limpiamos todas las variables de entorn   
clear net;
choise =1;
while choise ~= 0
    %se eliminan la figuras de otros plots
    if exist('fig','var')
        close(ancestor(fig, 'figure'))
        clear fig
    end
    choise =0;
    %esperamos a que la interfaz termine o se crea.
    %se tiene que escoger que opcion se quiere al estar ubicadas en
    %carpetas diferentes se tiene que entrar en la carpeta
     waitfor(GUI_Menu)
     switch choise
     case 1
         cd C:\Users\tatxo\Documents\MATLAB\GUI_ALL_Plots
         GUI
         case 2
         clear Xtrain; 
         clear Ytrain;
         cd C:\Users\tatxo\Documents\MATLAB\
         Data_adquisition_Train
     case 3
         cd C:\Users\tatxo\Documents\MATLAB\
         Classify
     end
 end  