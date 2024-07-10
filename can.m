num_samples = 1000;
can_id = hex2dec('123');
sample_time = 0.01;
frequency = 1;
amplitude = 50;
offset = 25;
noise_amplitude = 5;
fc = 2;

t = (0:num_samples-1) * sample_time;

data_sine = amplitude * sin(2 * pi * frequency * t);
data_square = offset + square(2 * pi * frequency * t);
data_noise = noise_amplitude * randn(1, num_samples);
data_combined = data_sine + data_square + data_noise;

[b, a] = butter(2, fc / (1 / (2 * sample_time)));
data_filtered = filtfilt(b, a, data_combined);

data_fft = fft(data_combined);
frequencies = (0:num_samples-1) * (1 / (num_samples * sample_time));

rms_value = rms(data_combined);

Kp = 1.0;
Ki = 0.1;
Kd = 0.01;
reference = 50 * ones(1, num_samples);
pid_output = zeros(1, num_samples);
error_sum = 0;
previous_error = 0;

figure;
for i = 1:num_samples
    error = reference(i) - data_combined(i);
    error_sum = error_sum + error;
    error_diff = error - previous_error;
    
    pid_output(i) = Kp * error + Ki * error_sum + Kd * error_diff;
    
    previous_error = error;
    
    can_message = struct;
    can_message.ID = can_id;
    can_message.Data = uint8(typecast(int16(data_combined(i)), 'uint8'));
    
    disp(['Sending CAN message with ID: 0x', dec2hex(can_message.ID), ...
          ', Data: ', num2str(data_combined(i))]);
    
    pause(sample_time);
    
    plot3(t(1:i), data_sine(1:i), data_square(1:i), 'b');
    xlabel('Time (s)');
    ylabel('Sine Wave');
    zlabel('Square Wave');
    title('Real-Time Simulated CAN Signal in ECU');
    grid on;
    drawnow;
end

figure;
subplot(4,1,1);
plot(t, data_combined);
title('Combined Data');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, data_filtered);
title('Filtered Data (Low-pass)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(frequencies, abs(data_fft));
title('Fourier Transform');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(4,1,4);
plot(t, pid_output);
title('PID Controller Output');
xlabel('Time (s)');
ylabel('Control Signal');
grid on;

disp(['RMS Value of Combined Data: ', num2str(rms_value)]);
