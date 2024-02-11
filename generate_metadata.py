import json
import os
import random

# Define the base directory for saving metadata files
metadata_directory = "metadata"
os.makedirs(metadata_directory, exist_ok=True)

# Define errors for attributes
errors = [
    {"trait_type": "Kernel Panic", "value": "0xDEADCODE"},
    {"trait_type": "Kernel Panic", "value": "0xBADCAFE"},
    {"trait_type": "Kernel Panic", "value": "0xFEEDFACE"},
    {"trait_type": "Bluescreen Error", "value": "0x000000EF"},
    {"trait_type": "Bluescreen Error", "value": "0x000000FE"},
    {"trait_type": "Bluescreen Error", "value": "0xDEADBEEF"},
    {"trait_type": "Signal Noise", "value": "High"},
    {"trait_type": "Signal Noise", "value": "Medium"},
    {"trait_type": "Signal Noise", "value": "Low"},
    {"trait_type": "Pixel Disruption", "value": "Severe"},
    {"trait_type": "Pixel Disruption", "value": "Moderate"},
    {"trait_type": "Pixel Disruption", "value": "Minor"},
    {"trait_type": "Memory Leak", "value": "banantosh_Overflow"},
    {"trait_type": "Division By Zero", "value": "Math_Error"},
    {"trait_type": "Underflow Error", "value": "banantosh_Underflow"},
    {"trait_type": "Overflow Error", "value": "Math_Overflow"},
    {"trait_type": "Disk Read Error", "value": "PS1_Not_Found"},
    {"trait_type": "Graphics Glitch", "value": "PS2_Render_Fail"},
    {"trait_type": "Cartridge Error", "value": "NES_Unreadable"},
    {"trait_type": "VHS Tape Error", "value": "Tracking_Issue"},
    {"trait_type": "System Overheat", "value": "banantosh_Thermal_Shutdown"},
    {"trait_type": "Controller Disconnect", "value": "PS1_Controller_Lost"},
    {"trait_type": "Save Corruption", "value": "Memory_Card_Corrupted"},
    {"trait_type": "Audio Distortion", "value": "Sound_Chip_Failure"},
    {"trait_type": "Video RAM Error", "value": "VRAM_Failure"},
    {"trait_type": "Firmware Crash", "value": "banantosh_Update_Failed"},
]

# Generate and save metadata files
for i in range(107):
    metadata = {
        "name": f"AiFace #{i}",
        "description": "A unique AiFace NFT by a glitch artist, representing digital abstraction and aesthetic disruption. Created by banantosh_.",
        "image": f"https://raw.githubusercontent.com/johnnieskywalker/ai-faces/main/pictures/{i}.jpg",
        "attributes": [random.choice(errors) for _ in range(4)]
    }
    
    # Define the filename for the current metadata file
    filename = f"{metadata_directory}/{i}.json"
    
    # Write the metadata to the file
    with open(filename, 'w') as f:
        json.dump(metadata, f, indent=4)

# Output the path to the directory containing the metadata files
metadata_directory
