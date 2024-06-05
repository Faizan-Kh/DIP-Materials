% Read the image
I = imread('Group-1-3-5.tif');

ch1= I(:, :, 1);
ch2= I(:, :, 2);
ch3= I(:, :, 3);
ch4= I(:, :, 4);

cancatinated_image= ch4+ch1+ch2+ch3;


% Convert the image to double precision for processing
I_double = im2double(cancatinated_image);

% Convert the image to grayscale if it's not already
if size(I_double, 3) > 1
    gray_img = rgb2gray(I_double);
else
    gray_img = I_double;
end

% Perform FFT to obtain the frequency domain representation of the image
fft_img = fft2(gray_img);

% Shift the zero-frequency component to the center
fft_img_shifted = fftshift(fft_img);

% Define a high-pass filter in the frequency domain
[m, n] = size(gray_img);
radius = 50; % Adjust the radius of the high-pass filter
[X, Y] = meshgrid(1:n, 1:m);
center_x = round(n / 2);
center_y = round(m / 2);
high_pass_filter = double(sqrt((X - center_x).^2 + (Y - center_y).^2) > radius);

% Apply the high-pass filter in the frequency domain
fft_img_high_pass = fft_img_shifted .* high_pass_filter;

% Inverse FFT to obtain the filtered image in spatial domain
filtered_img = real(ifft2(ifftshift(fft_img_high_pass)));

% Display the filtered image
figure;
imshow(filtered_img);
