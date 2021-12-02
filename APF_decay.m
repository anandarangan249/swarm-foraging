function APF_new = APF_decay(APF)
    APF_size = size(APF,1);
    pad = 255.*ones(APF_size,1);
    
    % Decay and Diffusion Rate
    decay = 0.1;
    diff_rate = 0.02;
    
    APF1 = [APF(:,2:APF_size),pad];
    APF2 = [pad,APF(:,1:APF_size-1)];
    APF3 = [APF(2:APF_size,:);pad'];
    APF4 = [pad';APF(1:APF_size-1,:)];
    APF_new = (1-decay).*(APF-255)+255 + (diff_rate).*(APF1-255) + (diff_rate).*(APF2-255) + (diff_rate).*(APF3-255) + (diff_rate).*(APF4-255);
end