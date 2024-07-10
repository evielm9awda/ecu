num_samples = 1000;
can_id = hex2dec('123');
sample_time = 0.01;

t = (0:num_samples-1) * sample_time;
data = 100 * sin(2 * pi * 1 * t);

for i = 1:num_samples
    can_message = struct;
    can_message.ID = can_id;
    can_message.Data = uint8(typecast(int16(data(i)), 'uint8'));

    disp(['Sending CAN message with ID: 0x', dec2hex(can_message.ID), ', Data: ', num2str(data(i))]);

    pause(sample_time);
end
