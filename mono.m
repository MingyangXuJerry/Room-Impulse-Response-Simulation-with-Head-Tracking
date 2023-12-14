%% function mono
function y = mono(x)
% x: input signal
if size(x,2) == 1
    y = x;
else
    y = zeros(length(x), 1);
    for frame = 1:length(x)
        channel_sum = 0;
        num_channel = size(x,2);
        for channel = 1:num_channel
            channel_sum = channel_sum + x(frame, channel);
        end
        y(frame, 1) = channel_sum/num_channel;
    end
end
end