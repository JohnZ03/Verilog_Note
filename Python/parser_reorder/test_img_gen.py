from PIL import Image
import matplotlib.pyplot as plt
import numpy as np


# function generates 680x480 image with 40x40 grids
def generate_grid_image(chunk_size=40):
    rows = 680
    cols = 480

    matrix = np.zeros((rows, cols))

    for i in range(rows // chunk_size):
        for j in range(cols // chunk_size):
            if (i + j) % 2 == 0:
                matrix[i*chunk_size:(i+1)*chunk_size, j*chunk_size:(j+1)*chunk_size] = 1

    return matrix

#############################################################################
# Open the image
img = Image.open('./imgs/badapple.png')

# Resize the image and fill empty pixels with white
resized_img = img.resize((680, 480), Image.ANTIALIAS).convert('RGB')
new_img = Image.new('RGB', (680, 480), (255, 255, 255))
new_img.paste(resized_img, (0, 0))

# Convert the image to a binary matrix
binary_matrix = np.asarray(new_img.convert('1'))

# Split the binary_pixels list into even and odd columns
even_cols = [row[::2] for row in binary_matrix]
odd_cols = [row[1::2] for row in binary_matrix]

# plt.imshow(odd_cols, cmap='gray')
# plt.show()

rows = len(even_cols)
cols = len(even_cols[0])

print("Shape of the list: ({}, {})".format(rows, cols))

# open mapping index
with open('col_reorder.txt') as my_file:
    mapping_array = my_file.read().splitlines()

mapping_array = [int(e) for e in mapping_array]

new_even_cols = [[row[i] for i in mapping_array] for row in even_cols]
new_odd_cols = [[row[i] for i in mapping_array] for row in odd_cols]

# Restore the original order of the columns
restored_even_cols = [[row[mapping_array.index(i)] for i in range(len(row))] for row in new_even_cols]
restored_odd_cols = [[row[mapping_array.index(i)] for i in range(len(row))] for row in new_odd_cols]

# display the restored images
# plt.imshow(restored_odd_cols, cmap='gray')
# plt.show()

plt.imshow(generate_grid_image(), cmap='gray')
plt.show()

