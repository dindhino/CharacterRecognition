clear;
clc;

[X y] = loadmnist(5000);

X(1:1000,:) = [];
y(1:1000,:) = []

% visual(X(y==1,:));
xn = [X(y==1,:)
      X(y==6,:)
      X(y==8,:)];
  
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

nrow = size(xn,1);
jumBenar=0;
load hasilTrainingJST;
output = [];

for i=1:nrow
        
%   forward
    v = W1'* xn(i,:)'+ b1';
    A1 = 1/(1+exp(-v));
    v2 = W2'*A1'+b2;
    A2 = 1/(1+exp(-v2));
    e = yn(i) - A2;
    toterr = [toterr e];
        
    if A2 > 0.9
        hasil = 1;
    elseif A2 > 0.4
        hasil = 0.5
    else
        hasil = 0;
    end
    
    if hasil == yn(i)
        jumBenar = jumBenar + 1;
    end
    
    output = [output hasil];
end
    
akurasi = (jumBenar/nrow)*100;
fprintf('akurasi : %2f,3', akurasi);
disp('%');

visual(xn(output == 0.5,:));