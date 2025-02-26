import sys

def merge_ranges(items):
    sorted_items = sorted(items, key=lambda x: x[0])
    result = []

    for item in sorted_items:
        if not result or item[0] > result[-1][1]:
            result.append(item)
        else:
            result[-1] = (min(item[0], result[-1][0]), max(item[1], result[-1][1]))

    return result

# Read list from file
inputfile = sys.argv[1]
items = []

with open(inputfile, "r") as file:
    for line in file:
        start, end = map(int, line.strip().split())
        items.append((start, end))

# Merge ranges
merged_ranges = merge_ranges(items)
print(merged_ranges)
