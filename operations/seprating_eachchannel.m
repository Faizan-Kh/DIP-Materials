% Read the image
I = imread('Group-1-3-5.tif'); % Replace 'path_to_your_image.tif' with the actual path to your image

% Check the number of channels in the image
num_channels = size(I, 3);

if num_channels == 1
    % If the image has only one channel, it might be grayscale
    imshow(I);
elseif num_channels == 4
    % Store each channel in separate variables
    channel1 = I(:, :, 1);
    channel2 = I(:, :, 2);
    channel3 = I(:, :, 3);
    channel4 = I(:, :, 4);
    
    % Display each channel separately
    figure;
    imshow(channel1);
    title('Channel 1');
    figure;
    imshow(channel2);
    title('Channel 2');
    figure;
    imshow(channel3);
    title('Channel 3');
    
   figure;
    imshow(channel4);
    title('Channel 4');
    
    % Combine the first three channels into an RGB image
    combined_image = cat(3, channel1, channel2, channel3);
    
    % Display the combined RGB image
    figure;
    imshow(combined_image);
    title('Combined RGB Image');

    figure;
    imshow(I)
    title("Original Image")
else
    % If the number of channels is neither 1 nor 4, you may need to handle it differently based on your specific case
    disp('The image has an unsupported number of channels.');
end
