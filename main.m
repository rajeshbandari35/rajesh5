clc;
clear all;
a='C:\Users\RAJESH\Documents\MATLAB\PVdatasec\input\baboon64.jpg';
a1=imread('C:\Users\RAJESH\Documents\MATLAB\PVdatasec\input\baboon64.jpg');
intensity=a1(:);
d=dec2bin(intensity);
[row,col]=size(d');
r=reshape(d',row,col);
fid=fopen('C:\Users\RAJESH\Documents\MATLAB\PVdatasec\textfiles\imagetobinary.txt','w');
fwrite(fid,r);
%disp('Image to Text Saved');
%fclose('all');


im1='C:\Users\RAJESH\Documents\MATLAB\PVdatasec\textfiles\imagetobinary.txt';
im2='C:\Users\RAJESH\Documents\MATLAB\PVdatasec\input\lena.jpg';
im3='C:\Users\RAJESH\Documents\MATLAB\PVdatasec\output\stego.bmp';
PVDATASCEMBD(im1,im2,im3)
imshow(im3);


PVDATASCEXTRCT(im3,'C:\Users\RAJESH\Documents\MATLAB\PVdatasec\textfiles\out.txt')
fid=fopen('C:\Users\RAJESH\Documents\MATLAB\PVdatasec\textfiles\out.txt','r');

DataC = textscan(fid, '%s', 'delimiter', '\n', 'whitespace', '');

Data  = DataC{1};

r = cell2mat(Data);
numel(r);
d = zeros(64);
x=1;
for i=1:64
    for j=1:64
        d(i,j) = bin2dec(r(x:x+7));
        x=x+8;
    end
    if(x>numel(r))
        break;
    end
end
d=d';

imwrite(uint8(d),'C:\Users\RAJESH\Documents\MATLAB\PVdatasec\output\extracted.jpg','jpg');
%fwrite(fid,r);
disp('Image Saved');
fclose('all');


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        