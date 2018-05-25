clear;
close all;

img = imread("429a.png");

processed = translate(img, [0,1], 1);

i=1;

subplot(2,1,i++), imshow(img,[]), title("original");

subplot(2,1,i++), imshow(processed,[]),title("filtered");
