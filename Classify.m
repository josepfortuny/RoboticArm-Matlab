%% codigo
%%%%%%%%%%%%%%%%%%%%%%%
%load training variables
%%%%%%%%%%%%%%%%%%%%%%%
choise =0;
while choise == 0
    Load_database();
end
if choise ==5
    %do nothing
else
    miniBatchSize=128;
    fig = figure;
    Index_data = 0;
    aux = "none";
    while ishandle(fig)
        Index_data = Index_data+1;
        Xpred {Index_data,:} = [0 ;0 ;0];
        Ypred = 0;
        samples = 1;
        %per eliminar la primera mostra de l'arduino que sempre es 0
        servo = readVoltage(connection,Pin_Servo);
        biceps = readVoltage(connection,Pin_Biceps);
        triceps = readVoltage(connection,Pin_Triceps);
        Xpred{Index_data,:} (1,samples)= 0;
        Xpred{Index_data,:} (2,samples)= 0;
        Xpred{Index_data,:} (3,samples)= 0;
        format shortg;
        c = clock;
        Ts = 0.2;
        while samples <= 10 && ishandle(fig)
            tic
            servo = servo_translate(readVoltage(connection,Pin_Servo));
            biceps = Modular_Filter(readVoltage(connection,Pin_Biceps),1);
            triceps = Modular_Filter(readVoltage(connection,Pin_Triceps),1);
            Xpred{Index_data,:} (1,samples)= servo;
            Xpred{Index_data,:} (2,samples)= biceps;
            Xpred{Index_data,:} (3,samples)= triceps;
            plot(Xpred{Index_data,:}')
            legend(string(llegenda(1:3)), 'Location','northeastoutside')
            title({"Classify data " + Index_data ;"Last prediction = " + aux })
            axis([ 0 , 10 , 0 , 90 ])
            samples = samples+1;
            while toc < Ts end
        end
            format shortg;
            fi = abs (c - clock);    
            Ypred = classify(net,Xpred{Index_data,:},'MiniBatchSize',miniBatchSize);
            aux = cellstr (Ypred);
    end
    close(ancestor(fig, 'figure'))
end
