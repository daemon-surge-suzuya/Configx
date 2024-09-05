{ pkgs, lib, ... }:

let
_ = lib.getExe;
in

pkgs.writeShellScriptBin "ch-mac" ''

#!/bin/bash

# Function to display script usage
usage() {
  echo "Usage: $0 [-i <interface>] [-m <new_mac>] [-r]"
  echo
  echo "Options:"
  echo "  -i <interface>   Specify the network interface (default: wlp3s0)"
  echo "  -m <new_mac>     Specify the new MAC address"
  echo "  -r               Use a random MAC address"
  echo "  --help           Display this help message"
}

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Check if no arguments are provided
if [ "$#" -eq 0 ]; then
  usage
  exit 1
fi

# Set default values
interface="wlp3s0"
new_mac=""
use_random_mac=false

# Parse command-line arguments using getopt
options=$(getopt -o i:m:r --long help -n "$0" -- "$@")
if [ $? -ne 0 ]; then
  echo "Invalid option" >&2
  usage
  exit 1
fi

eval set -- "$options"

# Process options
while true; do
  case "$1" in
    -i)
      interface="$2"
      shift 2
      ;;
    -m)
      new_mac="$2"
      shift 2
      ;;
    -r)
      use_random_mac=true
      shift
      ;;
    --help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
  esac
done

# Generate a random MAC address if the -r flag is provided or no MAC address is provided
if [ "$use_random_mac" = true ] || [ -z "$new_mac" ]; then
  new_mac="02:$(${_ pkgs.openssl} rand -hex 5 | sed 's/\(..\)/\1:/g; s/.$//')"
fi

# Disable the network interface
ip link set dev "$interface" down

# Change the MAC address
ip link set dev "$interface" address "$new_mac"

# Enable the network interface
ip link set dev "$interface" up

echo "Changed MAC address of $interface to $new_mac"

''
