Room Impulse Response Simulation with the Image-Source Method and HRTF Interpolation with Head Tracking

Final project for DST2 by Jerry Xu

-------------------------------------------------------------------------------------------------------
Summary

This project aims to estimate the impulse response (RIR) of a box-shaped room using the image-source method and obtain the binaural reproduction of a sound source in the room.
Custom-made hardware built with an Arduino board and an inertial measurement unit (IMU) is utilized to track head orientation and control the direction of arrival of a sound source by applying head-related transfer functions (HRTF).
The project also offers an option for simulating head movement without using external hardware for head tracking.

-------------------------------------------------------------------------------------------------------
Installation

Environment
	MATLAB R2022b

Required Hardware
	Arduino Uno
	Invensense MPU-9250

Hardware Installation
	See "Hardware Connection" in JerryXu_FinalProject.mlx.

Required MATLAB Add-Ons
	MATLAB Support Package for Arduino Hardware (skip if not using Arduino)
	Sensor Fusion and Tracking Toolbox (skip if not using arduino)
	Audio Toolbox
	Navigation Toolbox

Installing MATLAB add-ons
	HOME --> ENVIRONMENT --> Add-Ons --> Get Add-Ons --> Search for add-ons

-------------------------------------------------------------------------------------------------------
Hardware Configuration (skip if not using Arduino)

	1. Connect Arduino to usb port.
	2. Find port number for Arduino
		Windows
			(1) Open Device Manager, and expand the Ports (COM & LPT) list.
			(2) Note the number on the USB Serial Port.
		Macintosh
			(1) Open terminal and type: ls /dev/*.
			(2) Note the port number listed for /dev/tty.usbmodem* or /dev/tty.usbserial*. The port number is represented with * here.
		Linux
			(1) Open terminal and type: ls /dev/tty*.
			(2) Note the port number listed for /dev/ttyUSB* or /dev/ttyACM*. The port number is represented with * here.
			(3) Use the listed port as the serial port in MATLAB®. For example: /dev/ttyUSB0.
	3. Under "Hardware Configuration" in JerryXu_FinalProject.mlx
		(1) set "isUseArduino" to true (false if not using Arduino).
		(2) set "port" to the port number as found in the last step.

-------------------------------------------------------------------------------------------------------
Required User Inputs
	1. location of the audio file
	2. sampling frequency (skip if reading data from saved file)
	3. room dimensions (skip if reading data from saved file)
	4. receiver coordinates (skip if reading data from saved file)
	5. source coordinates (skip if reading data from saved file)
	6. materials of the floor, walls, and ceiling (skip if reading data from saved file)
	7. location of the HRTF dataset file (skip if reading data from saved file)
	8. option for whether to read data from saved file
	9. location of the saved file (skip if generating room impulse response using new data)
	10. option for whether to use Arduino for head tracking
	11. port number of the Arduino board (skip if not using Arduino)
	12. sample rate of the IMU (skip if not using Arduino)

-------------------------------------------------------------------------------------------------------
Files included

JerryXu_FinalProject
	JerryXu_FinalProject.mlx
	JerryXu_FinalReport.pdf
	README.md
	DataManager.m
	HelperBox.m
	HelperImageSource.m
	HelperOrientationViewer.m
	mono.m
	plotRoom.m
	WallMaterialAbsorptionCoefficients.m
	ARIHRTFDatasets
		NH2.mat
		NH4.mat
		NH5.mat
		NH8.mat
	audio
		music_qiuqiu.wav
		music_theVamp.wav
		percussion_conga.wav
		percussion_doublesnare.wav
		vocal_new_emotions.wav
		vocal_qiuqiu.wav
	data
		h_1.txt
		h_2.txt
		h_3.txt
		h_4.txt
		h_5.txt
		h_6.txt
		h_7.txt
	references
		BinauralAudioRenderUsingHeadTrackingExample.mlx
		RoomImpulseResponseImageSourceExample.mlx
		Fast image method for impulse response calculations of box-shaped rooms.pdf
		EstimateOrientationUsingInertialSensorFusionAndMPU9250Example
		
