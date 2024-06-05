% Read the image
I = imread('Group-1-3-5.tif');

% Combine the three channels into an RGB image
rgb_img = cat(3, I(:, :, 1), I(:, :, 2), I(:, :, 3));

% Convert the RGB image to grayscale
gray_img = rgb2gray(rgb_img);

% Perform histogram equalization on the grayscale image
eq_gray_img = histeq(gray_img);

% Convert the equalized grayscale image back to RGB
eq_rgb_img = cat(3, eq_gray_img, eq_gray_img, eq_gray_img);

% Display the original and equalized images
subplot(1, 2, 1);
imshow(rgb_img);
title('Original RGB Image');

subplot(1, 2, 2);
imshow(eq_rgb_img);
title('Histogram Equalized RGB Image');
