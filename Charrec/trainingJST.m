clear;
clc;

inputan = xlsread('DS.xls');

epoch = 26;
lr = 0.5;
in = 4;
hidden = 6;
out = 1;
W1 = rand(in,hidden);
b1 = rand(1, hidden);
W2 = rand(hidden, out);
b2 = rand(1, out);
nrow = size(inputan,1);
totMSE = [];

disp(W1);
disp(b1);
disp(inputan);
disp(nrow);

for j=1:epoch
    toterr = [];
    for i=1:nrow
        
%         forward
        v = W1'* inputan(i,1:4)'+ b1';
        A1 = 1/(1+exp(-v));
        v2 = W2'*A1'+b2;
        A2 = 1/(1+exp(-v2));
        e = inputan(i,5) - A2;
        toterr = [toterr e];
        
%         backward
        D2 = A2*(1-A2)*e;
        D1 = A1*(1-A1)'*(W2*D2);
        dW1 = lr * D1 * inputan(i,1:4);
        dW2 = lr * D2 * A1;
        dB1 = lr * D1;
        dB2 = lr * D2;
        
%         perbaikan bobot
        W1 = W1+dW1';
        W2 = W2+dW2';
        
%         perbaikan bias
        b1 = b1 + dB1';
        b2 = b2 + dB2';
        
    end 
    MSE = mean(toterr.^2);
%     disp(MSE);
    totMSE = [totMSE MSE];
end
% 
plot(totMSE);
save hasilTrainingJST