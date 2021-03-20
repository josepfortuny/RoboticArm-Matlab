%%INIT Variables
GUI_plot_Servo = 0;
GUI_plot_Fuerza = 0;
GUI_plot_Biceps = 0;
GUI_plot_Triceps = 0;
t = 0 ;
t2 =0;
GUI_plot_Servo_filtrat = 0;
GUI_plot_Fuerza_filtrat = 0;
GUI_plot_Biceps_filtrat = 0;
GUI_plot_Triceps_filtrat = 0;
startSpot = 0;
step = 0.1 ; % lowering step has a number of cycles and then acquire more data
samples = 80;
fig = figure;
%% Start processing
while ishandle(fig)
%   %NO TOCARR!!!! es la matriu de temps
    t = [t,(t(end)+step)];
    GUI_plot_Fuerza = [ GUI_plot_Fuerza, fuerza_translate(readVoltage(connection,Pin_Fuerza))];
    GUI_plot_Fuerza_filtrat = [ GUI_plot_Fuerza_filtrat, Modular_Filter(GUI_plot_Fuerza,3)];
    GUI_plot_Servo = [ GUI_plot_Servo, servo_translate(readVoltage(connection,Pin_Servo)); ];
    GUI_plot_Servo_filtrat = [ GUI_plot_Servo_filtrat, Modular_Filter(GUI_plot_Servo,4)];
    GUI_plot_Biceps = [ GUI_plot_Biceps, readVoltage(connection,Pin_Biceps)];
    GUI_plot_Biceps_filtrat = [ GUI_plot_Biceps_filtrat, Modular_Filter(GUI_plot_Biceps,9)];
    GUI_plot_Triceps = [ GUI_plot_Triceps, readVoltage(connection,Pin_Triceps)];
    GUI_plot_Triceps_filtrat = [ GUI_plot_Triceps_filtrat, Modular_Filter(GUI_plot_Triceps,9)];
    GUI_Lineal(GUI_plot_Servo,GUI_plot_Fuerza,GUI_plot_Fuerza_filtrat,GUI_plot_Biceps,GUI_plot_Biceps_filtrat,GUI_plot_Triceps,GUI_plot_Triceps_filtrat,t,t2);
     if length(t) >= samples
         t2 = t2+step;        
     end  
end
