# Gait-rehabilitation-monitoring
# Wearable inertial measurement unit（IMU）
The activity data is acquired by two wearable IMUs mounted on the thigh and shank, as shown in Fig. 1. The sensor node consists of an STM32F407 microcontroller, an MPU9250 accelerometer and gyroscope module, an Arduino Bluetooth module and a lithium battery (300 mAh). The size of the sensor node is 56.5×37.5×15.5 mm3, weighs 30 g, and the sampling frequency is 100 Hz. The range of accelerometer and gyroscope are ±156.5 m/s2 (16g) and ±34.9 rad/s (2000°/s), respectively. During data collection, the two sensor nodes are kept on the sagittal plane of the thigh and the shank. 
# Experimental data collection
In order to perform rehabilitation monitoring on the gait function of TKR patients, we designed a comparative test to obtain gait activity data of patients and healthy subjects. Before the experiment, participants will be instructed so that the experiment can be completed well. During the data collection period, patients are uniformly required to use walking aids to prevent falls. Between two consecutive experiments, the patient is allowed to rest for few minutes, and the relevant operations are performed by a professional physical therapist.  

Participants need to wear two wearable IMUs on both left and right sides, as shown in Fig. 2. When the walking command is given, the participants are asked walk a distance of 10 meters in a straight line and maintain their own rhythm. The gait activities are repeated twice for each participant.

# Original data description
The format of the original gait activity data is .bsn, which can be read and processed through the BSN_demo.m code. The original nine-axis sensor data will be obtained, including three-axis acceleration, gyroscope and magnetometer signals.
