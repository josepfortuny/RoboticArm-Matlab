function choise = Data_adquisition_menu(estado)
    choise =0;
   while choise == 0
        guiHandle = GUI_Train(estado)
        guiFigureHandle = guiHandle.UIFigure;
        uiwait(guiFigureHandle);
   end
end