col_width = 340

with open('col_reorder.txt') as my_file:
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

with open('wire_assign_v.txt', 'w') as file:
    for i in range(col_width):
        file.write("assign {}[{}] = {}[{}];\n".format(input_wire_name, i, output_wire_name, mapping_array[i]))
