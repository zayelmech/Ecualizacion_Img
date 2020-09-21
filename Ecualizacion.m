%Ejercicio No.7


clear all;
close all;
clc;

disp('working...');

img=imread('mdb013.bmp');
% img=imread('internet.PNG');

imgGray=img;

[sy sx sz]=size(img);
if sz==3
    imgGray=rgb2gray(img);
end 
imgGrayHist=imhist(imgGray);

imgDouble=double(imgGray);


h=imgGrayHist;
H=zeros(1,256);
H(1)=h(1);

for i=1:255
   H(i+1)=H(i) + h(i+1); 
end

NM=sy*sx;
% C=256/NM;

imgEcualizada=zeros(sy,sx);

for j=1:sy
    for i=1:sx
        valor=uint8(imgDouble(j,i));
        pq= H(valor+1);
        imgEcualizada(j,i) = round(((pq-1)/(NM-1))*255);
    end
end

imgEcuHist=imhist(uint8(imgEcualizada));

figure;

subplot(1,2,1);
imshow(imgGray);
title('Original Gray')

subplot(1,2,2);
imshow(uint8(imgEcualizada));
title('Ecualizada')

figure;
subplot(2,2,1);
stem(h);
title('Histograma original')

subplot(2,2,2);
stem(imgEcuHist);
title('Histograma Ecualizado');

subplot(2,2,3);
stem(H);
title('Distribución acumulativa')

h=imhist(uint8(imgEcualizada));
H=zeros(1,256);
H(1)=h(1);

for i=1:255
   H(i+1)=H(i) + h(i+1); 
end


subplot(2,2,4);
stem(H);
title('Distribución acum. nueva')

disp('Finished');
