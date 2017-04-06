clear all
clc
Fs = 1000;                          %Downsampled from 2400Hz to 1000Hz
F =importdata('alpha(8-12).mat');
chan_num = size(F,1);
PLI_sum = zeros(chan_num,chan_num);%To save outputs
L = 4*Fs;                          %Length of  window is 4s or 4000 samples 

W = hamming(L);                    %for Windowning
for trial_num = 1:round(size(F,2)/(2*Fs))-1 ; 
Signal = F(1:chan_num,Fs*2*(trial_num - 1)+1:2*(trial_num +1)*Fs);
%^^ breaking data to epoch with lenght 4000 samples and 2000 samples
%overlap
for j = 1:chan_num;
     SignalWIN = W*Signal(chan_num,:);
Phase(j,:) = angle(hilbert(SignalWIN(j,:)));%Compute phase for all data
end

for i = 1:chan_num;
    for m = 1:chan_num;
        PLI(i,m) = abs(mean(sin(sign(Phase(i,:)-Phase(m,:)))));
    end
end
PLI_sum = PLI + PLI_sum;

end
PLI_final = PLI_sum/trial_num;

 
figure;
imagesc(PLI_final)
colorbar
title('PLI for Alpha ferequency band')
xlabel('Channels')
ylabel('Channels')
 