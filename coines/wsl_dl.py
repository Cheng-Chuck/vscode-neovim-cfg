import subprocess
import os
import shlex
import argparse
from pathlib import Path

def convert_wsl_to_windows_path(wsl_path):
    """
    Converts a WSL (Windows Subsystem for Linux) path to a Windows path.
    Args:
        wsl_path (str): The WSL path to be converted.
    Returns:
        str: The corresponding Windows path if conversion is successful, None otherwise.
    Raises:
        subprocess.CalledProcessError: If the conversion process fails.
    Notes:
        - This function uses the `wslpath` command to perform the conversion.
        - Ensure that WSL is installed and properly configured on your system.
        - The function captures and prints any errors encountered during the conversion process.
    """
    try:
        result = subprocess.run(['wslpath', '-w', wsl_path], capture_output=True, text=True, check=True)
        windows_path = result.stdout.strip()
        return windows_path
    except subprocess.CalledProcessError as e:
        print(f"Path convert failed: {e.stderr}")
        return None

def download_firmware(dfu_util_path, firmware_path, device_id, location, reset_flag=True):
    """
    Downloads firmware to a device using dfu-util.
    Args:
        dfu_util_path (str): The path to the dfu-util executable.
        firmware_path (str): The path to the firmware file.
        device_id (str): The ID of the device to which the firmware will be downloaded.
        location (str): The location on the device where the firmware will be written.
    Returns:
        None
    Raises:
        subprocess.CalledProcessError: If the dfu-util command fails.
    """
    windows_firmware_path = convert_wsl_to_windows_path(firmware_path)
    if not windows_firmware_path:
        print("Failed to convert WSL path to Windows path.")
        return
    
    command = [
        dfu_util_path,
        '--device', device_id,
        '-a', location,
        '-D', windows_firmware_path
    ]
    
    if reset_flag:
        command.append('-R')
    
    command_str = ' '.join(shlex.quote(arg) for arg in command)
    
    print(f"Run command: {command_str}")
    
    try:
        result = subprocess.run(command_str, shell=True, capture_output=True, text=True, check=True)
        print("dfu_util output:")
        print(result.stdout)
        if result.stderr:
            print("dfu_util failed:")
            print(result.stderr)
    except subprocess.CalledProcessError as e:
        print("Run dfu_util failed:")
        print(e.stdout)
        print(e.stderr)

def app_switch(app_switch_path, com_port) -> bool:
    """
    Executes a command to switch the application using the provided path and optional COM port.
    Args:
        app_switch_path (str): The path to the application switch executable.
        com_port (str, optional): The COM port to use for the command. Defaults to None.
    Returns:
        bool: True if the command executed successfully, False otherwise.
    Raises:
        subprocess.CalledProcessError: If the command execution fails.
    """
    command = [
        app_switch_path,
        'usb_dfu_bl',
    ]
    if com_port:
        command.append(com_port)

    command_str = ' '.join(shlex.quote(arg) for arg in command)
        
    try:
        result = subprocess.run(command_str, shell=True, capture_output=True, text=True, check=True)
        print("app_switch output:")
        print(result.stdout)
        if result.stderr:
            print("app_switch failed:")
            print(result.stderr)
            return False
    except subprocess.CalledProcessError as e:
        print("Run app_switch failed:")
        print(e.stdout)
        print(e.stderr)
        return False
    
    return True


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Download firmware to a device using dfu-util.")
    parser.add_argument('--target', type=str, required=True, default="", help='The target MCU of the device to which the firmware will be downloaded.')
    parser.add_argument('--location', type=str, required=True, help='The location on the device where the firmware will be written.')
    parser.add_argument('--bin', type=str, required=True, help='The path to the binary file.')

    args = parser.parse_args()
    
    app_switch_path = r"/mnt/c/Project/01_Tools/coines_dl/app_switch/app_switch.exe"
    dfu_path = r"/mnt/c/Project/01_Tools/coines_dl/usb-dfu/dfu-util.exe"

    if str(args.target).upper() == 'MCU_APP31':
        DEVICE = '-,108c:ab39'
    elif str(args.target).upper() == 'MCU_APP30':
        DEVICE = '-,108c:ab3d'
    else:
        DEVICE = ''

    LOCATION = args.location
    BIN = Path(args.bin).absolute().__str__()

    if not LOCATION:
        print("location is mandatory")
        exit(1)
        
    if not BIN:
        print("bin is mandatory")
        exit(1)
        
    if not app_switch(app_switch_path=app_switch_path, com_port=None):
        print("Failed to switch to USB DFU bootloader.")
        exit(1)

    download_firmware(
        dfu_util_path=dfu_path,
        firmware_path=BIN,
        device_id=DEVICE,
        location=LOCATION,
        reset_flag=True
    )
