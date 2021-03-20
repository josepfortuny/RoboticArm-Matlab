function [] = GUI_Lineal(plot_Servo,plot_Fuerza,plot_Fuerza_filtrat,plot_Biceps,plot_Biceps_filtrat,plot_Triceps,plot_Triceps_filtrat,t,t2)

    subplot(2,2,1)
    plot(t ,plot_Servo);
    title ("Servo Position");
    xlabel('Time (seconds)','Fontsize',10);
    ylabel('Degrees (º)','Fontsize',10);
    axis([ t2+0 , t2+10 , 0 , 90 ]);
    grid
    
     subplot(2,2,2)
     plot (t, plot_Fuerza_filtrat);
     title ("User Strength");
     xlabel('Time (seconds)','Fontsize',10);
     ylabel('Value','Fontsize',10);
     axis([t2+0 , t2+10 , 0 , 0.3 ]);
     grid
     
     subplot(2,2,3)
     plot (t, plot_Biceps_filtrat);
     title ("Biceps");
     xlabel('Time (seconds)','Fontsize',10);
     ylabel('Value','Fontsize',10);
     axis([t2+0 , t2+10 , 0 , 5 ]);
     grid
     
     subplot(2,2,4)
     plot (t, plot_Triceps_filtrat);
     title ("Triceps");
     xlabel('Time (seconds)','Fontsize',10);
     ylabel('Value','Fontsize',10);
     axis([t2+0 , t2+10 , 0 , 5 ]);
     grid
     drawnow limitrate;
end

