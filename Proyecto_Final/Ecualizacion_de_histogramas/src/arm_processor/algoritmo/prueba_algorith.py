import matplotlib.pyplot as plt
def get_histogram(image):
    histogram = [0]*8
    for row in image:
        for pixel in row:
            histogram[pixel] += 1
    return histogram

def get_cumulative_freq(histogram):
    cumulative_freq = [0]*8
    cumulative_freq[0] = histogram[0]
    for i in range(1, 8):
        cumulative_freq[i] = cumulative_freq[i - 1] + histogram[i]
    return cumulative_freq

def normalize_cumulative_freq(cumulative_freq):
    total_pixels = cumulative_freq[-1]
    normalized_cumulative_freq = [round(f * 7 / total_pixels) for f in cumulative_freq]
    return normalized_cumulative_freq

def equalize_image(image, mapping):
    equalized_image = []
    for row in image:
        equalized_row = [mapping[pixel] for pixel in row]
        equalized_image.append(equalized_row)
    return equalized_image

def read_image_from_txt(file_path):
    with open(file_path, 'r') as file:
        image = [[int(pixel) for pixel in line.strip()] for line in file]
    return image

def write_image_to_txt(image, file_path):
    with open(file_path, 'w') as file:
        for row in image:
            file.write(''.join(str(pixel) for pixel in row))
            file.write('\n')




# Paso 1: cargar la imagen original
I = [
    [4,4,4,4],
    [3,4,5,4],
    [3,5,5,5],
    [3,4,5,4]
]

# Paso 2: Obtener histograma
hist = get_histogram(I)

# Paso 3: Obtener frecuencia acumulada
cuf = get_cumulative_freq(hist)

# Paso 4: Normalizar frecuencia acumulada
normalized_cuf = normalize_cumulative_freq(cuf)

# Paso 6: Ecualizar la imagen
Ip = equalize_image(I, normalized_cuf)

write_image_to_txt(Ip, 'output.txt')


def save_image_to_png(image, file_path):
    plt.imshow(image, cmap='gray')
    plt.axis('off')
    plt.savefig(file_path, bbox_inches='tight', pad_inches = 0)

def normalize_image(image):
    max_value = max(max(row) for row in image)
    min_value = min(min(row) for row in image)
    return [[(pixel - min_value) / (max_value - min_value) for pixel in row] for row in image]


I_normalized = normalize_image(I)
save_image_to_png(I_normalized, 'input.png')
Ip_normalized = normalize_image(Ip)
save_image_to_png(Ip_normalized, 'output.png')