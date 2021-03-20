Xtrain {1,:} = [0 ;0 ;0];
choise =2;
exit = 2;
guiHandle = GUI_Create_Options({''});
guiFigureHandle = guiHandle.UIFigure;
uiwait(guiFigureHandle);
if choise == 1
    Index_data_adquisition = 0;
    fig = figure;
    set(0,'DefaultFigureVisible','off');
    chose_Ytrain = 0;
    %% codigo
    while ishandle(fig) 
        samples = 1;
        exit = 2;
        guiHandle = GUI_Train(state_positions,Index_data_adquisition);
        guiFigureHandle = guiHandle.UIFigure;
        uiwait(guiFigureHandle);
        set(0,'DefaultFigureVisible','on');
        if (exit >= 1 )
            close(ancestor(fig, 'figure'))
            if exit == 1
                length_state = length(state_positions);
                Train_Network
            end
            choise = 2;
            break
        else
            exit =0;
            Ytrain (Index_data_adquisition,1) = state (choise_Ytrain);
            servo = readVoltage(connection,Pin_Servo);
            biceps = readVoltage(connection,Pin_Biceps);
            triceps = readVoltage(connection,Pin_Triceps);
            format shortg
            c = clock;
            Ts = 0.2;
            while samples <= 10
                tic
                servo = servo_translate(readVoltage(connection,Pin_Servo));
                biceps = Modular_Filter(readVoltage(connection,Pin_Biceps),1);
                triceps = Modular_Filter(readVoltage(connection,Pin_Triceps),1);
                Xtrain{Index_data_adquisition,:} (1,samples)= servo;
                Xtrain{Index_data_adquisition,:} (2,samples)= biceps;
                Xtrain{Index_data_adquisition,:} (3,samples)= triceps;
                samples = samples+1;
                while toc < Ts end
            end
                format shortg
                fi = abs (c - clock);
                plot(Xtrain{Index_data_adquisition,:}')
                title("training Observation" + Index_data_adquisition)
                legend(string(llegenda(1:3)) , 'Location','northeastoutside')
                axis([ 0 , 10 , 0 , 90 ]);
                drawnow;
        end
    end
end