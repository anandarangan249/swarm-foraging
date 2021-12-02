function display_sim(data, APF)
    % Display it.   
    figure(1);
    set(gcf,'Position',[50 50 1300 500]);
    subplot(1,2,1);
    image(data);
    subplot(1,2,2);
    image(APF);
    % Initialize a color map array of 256 colors.
    colorMap = turbo(256);
    % Apply the colormap and show the colorbar
    colormap(colorMap);
    colorbar;
    pause(0.001);
end