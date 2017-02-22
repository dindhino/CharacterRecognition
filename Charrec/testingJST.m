clear;
clc;

inputan = xlsread('DS.xls');

nrow = size(inputan,1);
jumBenar=0;
load hasilTrainingJST;

for i=1:nrow
        
%   forward
    v = W1'* inputan(i,1:4)'+ b1';
    A1 = 1/(1+exp(-v));
    v2 = W2'*A1'+b2;
    A2 = 1/(1+exp(-v2));
    e = inputan(i,5) - A2;
    toterr = [toterr e];
        
    if A2 > 0.5
        hasil = 1;
    else
        hasil = 0;
    end
    
    if hasil == inputan(i,5)
        jumBenar = jumBenar + 1;
    end
end
    
akurasi = (jumBenar/nrow)*100;
disp(akurasi);
fprintf('akurasi : %2f,3', akurasi);
disp('%');