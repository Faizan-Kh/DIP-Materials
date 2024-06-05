% Read the image
I = imread('Group-1-3-5.tif');

% Extract the first three channels to create an RGB image
rgb = cat(3, I(:, :, 1), I(:, :, 2), I(:, :, 3));

% Convert the RGB image to grayscale
gray_img = rgb2gray(rgb);

% Define the size of the mean filter kernel (e.g., 3x3)
filter_size = 3;

% Create a mean filter kernel
mean_kernel = ones(filter_size) / (filter_size^2);

% Apply the mean filter using imfilter
mean_filtered_img = imfilter(gray_img, mean_kernel, 'replicate');

% Display the mean-filtered image
imshow(mean_filtered_img);
