I = imread('Group-1-3-5.tif');
ch1 = I(:, :, 1);
ch2 = I(:, :, 2);
ch3 = I(:, :, 3);
ch4 = I(:, :, 4);
rgb = cat(3, ch1, ch2, ch3);
imshow(rgb);

% Convert the RGB image to grayscale
gray_img = rgb2gray(rgb);

% Apply Laplacian filter
laplacian_filter = imfilter(gray_img, fspecial('laplacian', 1), 'replicate');
figure;
imshow(laplacian_filter);
