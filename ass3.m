clear;
close all;

img = imread("429a.png");

k = -2;
processed = translate(img, k, "linear");
barlett = translate(img, k, "sinc-barlett");
hamming = translate(img, k, "sinc-hamming");
rect= translate(img, k, "sinc-rect");
cubic = translate(img,k,'cubic', -1);
bspline = translate(img, k,'b-spline');
i=1;
rows = 3;
cols = 3;

subplot(rows, cols, i++), imshow(img,[]), title("original");

subplot(rows, cols, i++), imshow(processed,[]),title("linear");

subplot(rows, cols, i++), imshow(barlett,[]),title("Barlett");

subplot(rows, cols, i++), imshow(hamming,[]),title("Hamming");

subplot(rows, cols, i++), imshow(rect,[]),title("Rectangle");

subplot(rows, cols, i++), imshow(cubic,[]),title("Cubic");

subplot(rows, cols, i++), imshow(bspline,[]),title("B-spline");

