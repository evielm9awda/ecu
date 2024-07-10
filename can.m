sample_time = 0.01;

t = (0:num_samples-1) * sample_time;
data = 100 * sin(2 * pi * 1 * t);
frequency = 1;
amplitude = 50;
offset = 25;
data_sine = amplitude * sin(2 * pi * frequency * t);
data_square = offset + square(2 * pi * frequency * t);
data = data_sine + data_square;

for i = 1:num_samples
    can_message = struct;
