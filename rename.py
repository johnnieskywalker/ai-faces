import os

# Set the directory path to the folder containing the files you want to rename
directory_path = 'pictures'

# Initialize a counter for the file names
counter = 0

# Iterate over all files in the directory
for filename in os.listdir(directory_path):
    # Construct the full file path
    file_path = os.path.join(directory_path, filename)
    if filename.lower().endswith('.jpg') and os.path.isfile(file_path):
        # Check if it's a file and not a directory
        if os.path.isfile(file_path):
            # Construct the new file name using the counter, and assume the file is a JPEG image
            new_filename = f"{counter}.jpg"
            new_file_path = os.path.join(directory_path, new_filename)
            
            # Rename the file
            os.rename(file_path, new_file_path)
            
            # Increment the counter for the next file
            counter += 1

print("Files have been renamed.")
