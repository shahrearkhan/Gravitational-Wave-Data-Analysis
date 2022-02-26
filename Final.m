%% Final Project
% Project III

% Shahrear Khan Faisal
% SID# 20574978

clc
clear

addpath 'D:\COURSE\Fall_2021\Gravitational Wave\Final Project'

% Sampling Frequency
fs = 16384; % Hz

% Load the two data files
A_raw = load('Day5dataA.txt');
B_raw = load('Day5dataB.txt');

t1 = length(A_raw)/fs; % duration of the data in seconds
% Length of the data
len = t1*fs; % duration*sampling frequency
% Time vector
tA =  0:1/fs:(len-1)/fs;

% Length of the data in seconds
t2 = length(B_raw)/fs; % duration of the data in seconds
% Length of the data
len = t2*fs; % duration*sampling frequency
% Time vector
tB =  0:1/fs:(len-1)/fs;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time window of 20 msec

% Number of samples in 20 msec
n = 20*fs/1000;
% Round to use as indices
n = round(n);
% Number of samples in 10 msec
n2 = 10*fs/1000;
% Round to use as indices
n2 = round(n2);
r = []; % Empty vector to store cross-correlation values

% Find cross-correlation
for i = 1:n2:length(B_raw)
    r = [r xcorr(A_raw(i:n), B_raw(i:n), 'normalized')]; % Normalized
end

% Plot the cross-correlation
figure(1);
plot(r);
title('Cross-correlation for time window = 20 msec');
xlabel('Time');
ylabel('Cross-correlation value');


clear r n n2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time window of 100 msec

n = 100*fs/1000;
% Round to use as indices
n = round(n);

n2 = 10*fs/1000;
% Round to use as indices
n2 = round(n2);

r = [];

for i = 1:n2:length(B_raw)
    r = [r xcorr(A_raw(i:n), B_raw(i:n), 'normalized')]; % Normalized
end

% Plot the cross-correlation
figure(2);
plot(r);
title('Cross-correlation for time window = 100 msec');
xlabel('Time');
ylabel('Cross-correlation value');



clear r n n2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time window of 500 msec

n = 500*fs/1000;
% Round to use as indices
n = round(n);

n2 = 10*fs/1000;
% Round to use as indices
n2 = round(n2);

r = [];

for i = 1:n2:length(B_raw)
    r = [r xcorr(A_raw(i:n), B_raw(i:n), 'normalized')]; % Normalized
end

% Plot the cross-correlation
figure(3);
plot(r);
title('Cross-correlation for time window = 500 msec');
xlabel('Time');
ylabel('Cross-correlation value');



% Apply Butterworth filter to A and B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% A
[b1,a1] = butter(6, [64/fs/2, 2048/fs/2]);
A = filter(b1,a1,A_raw);

% B
[b2,a2] = butter(6, [64/fs/2, 2048/fs/2]);
B = filter(b2,a2,B_raw);


% Redo the cross-correlation with filtered data

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time window of 20 msec

% Number of samples in 20 msec
n = 20*fs/1000;
% Round to use as indices
n = round(n);

n2 = 10*fs/1000;
% Round to use as indices
n2 = round(n2);

r = [];

for i = 1:n2:length(B)
    r = [r xcorr(A(i:n), B(i:n), 'normalized')]; % Normalized
end

% Plot the cross-correlation
figure(4);
plot(r);
title('Cross-correlation of filtered data for time window = 20 msec');
xlabel('Time');
ylabel('Cross-correlation value');



clear r n n2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time window of 100 msec

n = 100*fs/1000;
% Round to use as indices
n = round(n);

n2 = 10*fs/1000;
% Round to use as indices
n2 = round(n2);

r = [];

for i = 1:n2:length(B)
    r = [r xcorr(A(i:n), B(i:n), 'normalized')]; % Normalized
end

% Plot the cross-correlation
figure(5);
plot(r);
title('Cross-correlation of filtered data for time window = 100 msec');
xlabel('Time');
ylabel('Cross-correlation value');



clear r n n2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time window of 500 msec

n = 500*fs/1000;
% Round to use as indices
n = round(n);

n2 = 10*fs/1000;
% Round to use as indices
n2 = round(n2);

r = [];

for i = 1:n2:length(B)
    r = [r xcorr(A(i:n), B(i:n), 'normalized')]; % Normalized
end

% Plot the cross-correlation
figure(6);
plot(r);
title('Cross-correlation of filtered data for time window = 500 msec');
xlabel('Time');
ylabel('Cross-correlation value');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot both time series in the same figure
figure(7);
plot(tA,A_raw,'b',tB,B_raw,'r');
title('Time Series');
ylabel('Amplitude');
xlabel('Time (seconds)');
legend('A','B');



