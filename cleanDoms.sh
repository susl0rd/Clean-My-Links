#!/bin/bash

# Function to clean a domain
clean_domain() {
    # Remove wildcard prefix, www., everything after the first slash, and extract the core domain
    echo "$1" | sed -E 's/^\*\.//; s/^www\.//; s/\/.*$//' | awk -F. '{if (NF>2) {print $(NF-1)"."$NF} else {print $0}}'
}

# Function to validate a domain
validate_domain() {
    # Check if the domain contains a dot, no spaces, is not an IP address or IP range,
    # and doesn't consist only of numbers and dots
    if [[ "$1" == *.* && "$1" != *" "* && 
          ! "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ && 
          ! "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ &&
          ! "$1" =~ ^[0-9.]+$ ]]; then
        echo "$1"
    fi
}

# Check if an input file is provided
if [ $# -eq 0 ]; then
    echo "Error: No input file provided."
    echo "Usage: $0 <input_file> [output_file]"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Process each line, clean domains, validate, sort, and remove duplicates
process_domains() {
    while IFS= read -r line || [[ -n "$line" ]]; do
        cleaned=$(clean_domain "$line")
        validate_domain "$cleaned"
    done | sort | uniq
}

if [ -n "$output_file" ]; then
    process_domains < "$input_file" > "$output_file"
    echo "Cleaned, validated, and unique core domains have been saved to $output_file"
else
    process_domains < "$input_file"
fi

