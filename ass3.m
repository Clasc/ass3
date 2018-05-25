clear;
close all;

img = imread("429a.png");

offset = [1,0.5]
processed = translate(img, offset, "linear");
barlett = translate(img, offset, "sinc-barlett");
hamming = translate(img, offset, "sinc-hamming");

i=1;

subplot(3,2,i++), imshow(img,[]), title("original");

subplot(3,2,i++), imshow(processed,[]),title("linear");

subplot(3,2,i++), imshow(barlett,[]),title("Barlett");

subplot(3,2,i++), imshow(hamming,[]),title("Hamming");