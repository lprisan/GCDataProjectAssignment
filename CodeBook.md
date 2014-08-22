Human Activity Recognition Using Smartphones Dataset
(clean, subject/activity averages)
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables selected for these signals are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables (columns) is: 
1 Activity (character)
2 Subject (character)
3 tBodyAcc.mean...X (numeric)
4 tBodyAcc.mean...Y (numeric)
5 tBodyAcc.mean...Z (numeric)
6 tGravityAcc.mean...X (numeric)
7 tGravityAcc.mean...Y (numeric)
8 tGravityAcc.mean...Z (numeric)
9 tBodyAccJerk.mean...X (numeric)
10 tBodyAccJerk.mean...Y (numeric)
11 tBodyAccJerk.mean...Z (numeric)
12 tBodyGyro.mean...X (numeric)
13 tBodyGyro.mean...Y (numeric)
14 tBodyGyro.mean...Z (numeric)
15 tBodyGyroJerk.mean...X (numeric)
16 tBodyGyroJerk.mean...Y (numeric)
17 tBodyGyroJerk.mean...Z (numeric)
18 tBodyAccMag.mean.. (numeric)
19 tGravityAccMag.mean.. (numeric)
20 tBodyAccJerkMag.mean.. (numeric)
21 tBodyGyroMag.mean.. (numeric)
22 tBodyGyroJerkMag.mean.. (numeric)
23 fBodyAcc.mean...X (numeric)
24 fBodyAcc.mean...Y (numeric)
25 fBodyAcc.mean...Z (numeric)
26 fBodyAccJerk.mean...X (numeric)
27 fBodyAccJerk.mean...Y (numeric)
28 fBodyAccJerk.mean...Z (numeric)
29 fBodyGyro.mean...X (numeric)
30 fBodyGyro.mean...Y (numeric)
31 fBodyGyro.mean...Z (numeric)
32 fBodyAccMag.mean.. (numeric)
33 fBodyBodyAccJerkMag.mean.. (numeric)
34 fBodyBodyGyroMag.mean.. (numeric)
35 fBodyBodyGyroJerkMag.mean.. (numeric)
36 tBodyAcc.std...X (numeric)
37 tBodyAcc.std...Y (numeric)
38 tBodyAcc.std...Z (numeric)
39 tGravityAcc.std...X (numeric)
40 tGravityAcc.std...Y (numeric)
41 tGravityAcc.std...Z (numeric)
42 tBodyAccJerk.std...X (numeric)
43 tBodyAccJerk.std...Y (numeric)
44 tBodyAccJerk.std...Z (numeric)
45 tBodyGyro.std...X (numeric)
46 tBodyGyro.std...Y (numeric)
47 tBodyGyro.std...Z (numeric)
48 tBodyGyroJerk.std...X (numeric)
49 tBodyGyroJerk.std...Y (numeric)
50 tBodyGyroJerk.std...Z (numeric)
51 tBodyAccMag.std.. (numeric)
52 tGravityAccMag.std.. (numeric)
53 tBodyAccJerkMag.std.. (numeric)
54 tBodyGyroMag.std.. (numeric)
55 tBodyGyroJerkMag.std.. (numeric)
56 fBodyAcc.std...X (numeric)
57 fBodyAcc.std...Y (numeric)
58 fBodyAcc.std...Z (numeric)
59 fBodyAccJerk.std...X (numeric)
60 fBodyAccJerk.std...Y (numeric)
61 fBodyAccJerk.std...Z (numeric)
62 fBodyGyro.std...X (numeric)
63 fBodyGyro.std...Y (numeric)
64 fBodyGyro.std...Z (numeric)
65 fBodyAccMag.std.. (numeric)
66 fBodyBodyAccJerkMag.std.. (numeric)
67 fBodyBodyGyroMag.std.. (numeric)
68 fBodyBodyGyroJerkMag.std.. (numeric)