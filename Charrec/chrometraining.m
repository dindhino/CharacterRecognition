clear;
clc;

[X y] = loadmnist(1000);
% visual(X(y==1,:));
xn = [X(y==1,:)
      X(y==6,:)
      X(y==8,:)];
  5
yn = [y(y==1,:)
      y(y==6,:)
      y(y==8,:)];

xn = xn / 255;

yn(yn==1) = 0;
yn(yn==6) = 0.5;
yn(yn==8) = 1;

% visual(xn);
pos = randperm(size(xn,1));
xn = xn(pos,:);
yn = yn(pos,:);

% visual(xn);

epoch = 100;
lr = 0.1;
in = 784;
hidden = 6;
out = 1;
W1 = rand(in,hidden);
b1 = rand(1, hidden);
W2 = rand(hidden, out);
b2 = rand(1, out);
nrow = size(xn,1);
totMSE = [];


for j=1:epoch
    disp(j);
    toterr = []; 
    for i=1:nrow
        
%         forward
        v = W1'* xn(i,1:784)'+ b1';
        A1 = 1/(1+exp(-v));
        v2 = W2'*A1'+b2;
        A2 = 1/(1+exp(-v2));
        e = yn(i) - A2;
        toterr = [toterr e];
        
%         backward
        D2 = A2*(1-A2)*e;
        D1 = A1*(1-A1)'*(W2*D2);
        dW1 = lr * D1 * xn(i,:);
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

plot(totMSE);
save hasilTrainingJST