clc;
clear; %ÿ�α������֮ǰ���������ݣ�������ʾ������ƥ�������
close all;

[filename,pathname]=uigetfile('*.1bsn','ѡ��������ļ�','C:\Users\nic40\Desktop\IMU\����');
filepath=fullfile(pathname,filename);
f1=fopen(filepath,'r');
A=fread(f1);
Length=ftell(f1);%��ȡ�ļ���С
packet_Length=24;
File_sample_num=fix((Length-24)/(4+packet_Length));%�ļ��ܵĲ��������
Featurenum=fix(File_sample_num/100);

c=A(5:28,1);
m=33;

% w(1)=0;
% a=1;
% d=1;
% Q1=randn(1,File_sample_num)*1;
% Q2=randn(1,File_sample_num);


for i=1:File_sample_num-1
    b=A(m:m+23,1);
    m=m+28;
    c=[c,b];
end
c=c';

%����ȡ������������ת���ɶ�Ӧ������
for i=1:File_sample_num
    Acc_X_H(i)=c(i,1)+c(i,2)*256;
    Acc_Y_H(i)=c(i,3)+c(i,4)*256;
    Acc_Z_H(i)=c(i,5)+c(i,6)*256;
    Gyr_X_H(i)=c(i,7)+c(i,8)*256;
    Gyr_Y_H(i)=c(i,9)+c(i,10)*256;
    Gyr_Z_H(i)=c(i,11)+c(i,12)*256;
    Mag_X_H(i)=c(i,13)*256+c(i,14);
    Mag_Y_H(i)=c(i,15)*256+c(i,16);
    Mag_Z_H(i)=c(i,17)*256+c(i,18);
    Pitch_H(i)=c(i,19)+c(i,20)*256;
    Roll_H(i)=c(i,21)+c(i,22)*256;
    Yaw_H(i)=c(i,23)+c(i,24)*256;

    %��������Ķ���������ת��Ϊʮ��������
    if Acc_X_H(i)>32767
        Acc_X(i)=(Acc_X_H(i)-65535)*8/32768;
    else
        Acc_X(i)=Acc_X_H(i)*8/32768;
    end
    if Acc_Y_H(i)>32767
        Acc_Y(i)=(Acc_Y_H(i)-65535)*8/32768;
    else
        Acc_Y(i)=Acc_Y_H(i)*8/32768; 
    end
    if Acc_Z_H(i)>32767
        Acc_Z(i)=(Acc_Z_H(i)-65535)*8/32768;
    else
        Acc_Z(i)=Acc_Z_H(i)*8/32768;     
    end

    if Gyr_X_H(i)>32767
        Gyr_X(i)=(Gyr_X_H(i)-65535)*1000/32768;
    else
        Gyr_X(i)=Gyr_X_H(i)*1000/32768;
    end
    if Gyr_Y_H(i)>32767
        Gyr_Y(i)=(Gyr_Y_H(i)-65535)*1000/32768;
    else
        Gyr_Y(i)=Gyr_Y_H(i)*1000/32768;
    end
    if Gyr_Z_H(i)>32767
        Gyr_Z(i)=(Gyr_Z_H(i)-65535)*1000/32768;
    else
        Gyr_Z(i)=Gyr_Z_H(i)*1000/32768;    
    end

    if Mag_X_H(i)>32767
        Mag_X(i)=(Mag_X_H(i)-65535)*0.1;
    else
        Mag_X(i)=Mag_X_H(i)*0.1;
    end
    if Mag_Y_H(i)>32767
        Mag_Y(i)=(Mag_Y_H(i)-65535)*0.1;
    else
        Mag_Y(i)=Mag_Y_H(i)*0.1;
        end
    if Mag_Z_H(i)>32767
        Mag_Z(i)=(Mag_Z_H(i)-65535)*0.1;
    else
        Mag_Z(i)=Mag_Z_H(i)*0.1;   
    end   

end

