Digital Twin Dashboard - User Guide

Project Structure
The project contains two separate folders:

1. 2024 Version
   This folder contains the 2024 implementation of the Digital Twin Dashboard, including its App Designer file, Simulink model, and supporting scripts.

2. 2025 Version
   This folder contains the updated 2025 implementation of the dashboard. The functionality is similar to the 2024 version.

Each version is self-contained. Users can open and run either version independently.

How to Use the Application
1. Open the .mlapp file found inside either the 2024 or 2025 folder using MATLAB.
2. Enter the required input parameters in the app interface.
3. Click the Run Simulation button to execute the connected Simulink model. It will take a few seconds to run and show the plots.
4. Load experimental data if needed. After step 3 you may:
   - Select a CSV file from your computer, or
   - Paste a direct cloud URL to a CSV file.
5. The CSV file must contain two columns named:
   time
   acc
6. New plots will overlay on top of existing plots. Use the Clear Plots button if you want to reset the display.
7. If you want to change the total simulation time, this must be done directly inside the Simulink model. The app does not modify the Simulink time settings.

This folder structure allows you to choose which version of the dashboard you want to run while keeping all associated files organized and isolated.
