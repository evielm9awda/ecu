# ecu
Welcome to the ECU CAN Signal Simulation repo! This project is all about simulating CAN signals in an Electronic Control Unit (ECU) environment using MATLAB. We’ve packed this script with advanced signal processing, control systems, and real-time data visualization to make it as robust and useful as possible for anyone working with embedded systems and electronics.

## Features

- **Signal Generation**: Mixes sine wave, square wave, and Gaussian noise for a realistic signal.
- **Signal Processing**: Uses a low-pass Butterworth filter to clean up the signal.
- **Frequency Domain Analysis**: Applies Fourier Transform to break down the signal into its frequency components.
- **RMS Calculation**: Computes the Root Mean Square to measure signal power.
- **PID Controller**: Implements a PID controller to mimic control systems in ECUs.
- **Real-Time Visualization**: Updates a 3D plot dynamically to show the signal components over time.
- **CAN Message Simulation**: Constructs and prints out simulated CAN messages for a bit of realism.
## Screenshots
![1](https://github.com/evielm9awda/ecu/assets/126894089/498c2b58-4278-4775-bcad-9dfbbed0bf84)
![2](https://github.com/evielm9awda/ecu/assets/126894089/6f8e93c4-5c4a-4d3f-95f9-98e63a8d7b51)

## How to Use

1. **Clone the repo**:
    ```sh
    git clone https://github.com/evielm9awda/ecu
    ```

2. **Navigate to the project directory**:
    ```sh
    cd ECU-CAN-Signal-Simulation
    ```

3. **Run the MATLAB script**:
    Open [`can.m`](https://github.com/evielm9awda/ecu/blob/main/can.m) in MATLAB and hit run. Sit back and watch the magic happen.

## Dependencies

- MATLAB R2020b or later.
