% Read the image
I = imread('Group-1-3-5.tif');

% Extract the first three channels to create an RGB image
rgb = cat(3, I(:, :, 1), I(:, :, 2), I(:, :, 3));

% Convert the RGB image to grayscale
gray_img = rgb2gray(rgb);
figure;
imhist(gray_img)

% Apply Gaussian blur with a specified standard deviation
blurred_img = imgaussfilt(gray_img, 5); % Adjust the standard deviation (sigma) as needed

% Display the blurred image
figure;
imshow(blurred_img);
