col_width = 340

with open('./col_reorder.txt') as my_file:
    mapping_array = my_file.read().splitlines()

mapping_array = [int(e) for e in mapping_array]
mapping_array_sorted = mapping_array.copy()
mapping_array_sorted.sort()

# Check if all indices are mapped
for i in range(col_width):
    if mapping_array_sorted[i] != i:
        print("invalid index at {}".format(i))
        exit()

input_wire_name = "adc_parser_wire_i"
output_wire_name = "output_o"

# Zip the two lists together
zipped_lists = zip(mapping_array, mapping_array_sorted)

# Sort the zipped list by the first element of each tuple
sorted_lists = sorted(zipped_lists)

# Unzip the sorted list into separate lists
mapping_array_sorted, mapping_array = zip(*sorted_lists)

mapping_array = list(mapping_array)
mapping_array_sorted = list(mapping_array_sorted)

mapping_array = mapping_array[10:330]
mapping_array_sorted = mapping_array_sorted[:320]

# Reoder every four bytes, because of python ok pipeout uses little endian byte order
for i in range(0, len(mapping_array), 32):
    print(i)
    a = mapping_array[i+24:i+32]
    b = mapping_array[i+16:i+24]
    c = mapping_array[i+8:i+16]
    d = mapping_array[i:i+8]

    for j in range(8):
        mapping_array[i+j] = a[j]
        mapping_array[i+j+8] = b[j]
        mapping_array[i+j+16] = c[j]
        mapping_array[i+j+24] = d[j]


with open('wire_assign_v.txt', 'w') as file:
    for i in range(len(mapping_array)):
        file.write("assign {}[{}] = {}[{}];\n".format(output_wire_name, mapping_array_sorted[i], input_wire_name, mapping_array[i]))
