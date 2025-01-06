import numpy as np
from PIL import Image
import os

def txt_to_grayscale_image(txt_file, output_image, image_size=(1080, 1920)):
    """
    Converts grayscale data from a TXT file into an image.

    Parameters:
        txt_file (str): Path to the TXT file containing grayscale data.
        output_image (str): Path to save the generated image.
        image_size (tuple): Size of the image (height, width).
    """
    try:
        # Check if the file exists
        if not os.path.exists(txt_file):
            raise FileNotFoundError(f"The file {txt_file} does not exist")

        # Read the TXT file and convert it into a 1D numpy array
        with open(txt_file, 'r', encoding='utf-8') as f:
            data = []
            for line in f:
                try:
                    value = int(line.strip())
                    data.append(value)
                except ValueError:
                    print(f"Skipping invalid line: {line.strip()}")

        # Handle data size mismatch
        total_pixels = image_size[0] * image_size[1]
        if len(data) < total_pixels:
            print(f"Data is incomplete. Padding with zeros.")
            data.extend([0] * (total_pixels - len(data)))  # Padding
        elif len(data) > total_pixels:
            print(f"Data exceeds required size. Truncating.")
            data = data[:total_pixels]  # Truncating

        # Convert the 1D list to a 2D numpy array with the specified image size
        array = np.array(data, dtype=np.uint8).reshape(image_size)

        # Create an image from the numpy array
        img = Image.fromarray(array, mode='L')

        # Save the image
        img.save(output_image)
        print(f"Grayscale image saved as {output_image}")

    except Exception as e:
        print(f"Error: {e}")

# Example usage
txt_file = 'image/image_out/left_initial.txt'  # Replace with your TXT file path
output_image = 'output_grayscale_image.png'  # Replace with your desired output image path

# Generate the grayscale image
txt_to_grayscale_image(txt_file, output_image, image_size=(1080, 1920))
