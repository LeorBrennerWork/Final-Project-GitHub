from collections import defaultdict
import re

# # Dictionary to count occurrences of each unique name
# cell_count = defaultdict(int)

# # Regular expression to remove brackets and "_i_[integer]" patterns
# pattern = re.compile(r"(\[\d+\]|_i_\d+)")

# # Read the input file
# with open("cell_list.txt", "r") as file:
#     next(file)  # Skip header line if it exists
#     for line in file:
#         # Split the line by tab to get the cell name and cell type
#         cell_name, cell_type = line.strip().split("\t")
        
#         # Remove any bracketed numbers or "_i_[integer]" patterns to get the base name
#         base_name = re.sub(pattern, "", cell_name)
        
#         # Count the cell name without filtering for type
#         cell_count[base_name] += 1

# # Print the grouped counts
# for cell_name, count in cell_count.items():
#     print(f"{cell_name}: {count}")

# Open the input file and the output file
# with open("filteredcells.txt", "r") as infile, open("filtered_data.txt", "w") as outfile:
#     for line in infile:
#         # Write lines that do not contain 'VCC'
#         if "VCC" not in line:
#             outfile.write(line)

# print("Filtered data saved to 'filtered_data.txt'")

# Dictionary to hold grouped entries
cell_count = defaultdict(int)

# Regular expression to capture text before "__"
pattern = re.compile(r"(.*?)(__\d+)?$")

# Read the input file
with open("filtered_data.txt", "r") as infile:
    for line in infile:
        cell_name, _ = line.strip().split(": ")
        
        # Get the base name before "__" pattern
        base_name = pattern.match(cell_name).group(1)
        
        # Group by base name, with each count set to 16
        cell_count[base_name] = 16

# Write the output to a new file
with open("combined_data.txt", "w") as outfile:
    for name, count in cell_count.items():
        outfile.write(f"{name}: {count}\n")

print("Combined data saved to 'combined_data.txt'")