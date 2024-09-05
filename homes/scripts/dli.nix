{ pkgs, lib, ... }:

let
_ = lib.getExe;
in

pkgs.writeShellScriptBin "dli" ''

  # dli - Disk Links Info

  find_links() {
      target_file="$1"
      echo "Symbolic links to $target_file:"

      find . -type d \( -name '.nix-defexpr' -o -name 'channels_root' \) -prune -o \
          -type l -name "$(basename "$target_file")" \
          -exec readlink -f {} \; | sed "s|^|$target_file -> |"

      find -L . -type d \( -name '.nix-defexpr' -o -name 'channels_root' \) -prune -o \
          -type l -samefile "$target_file" \
          -not -name "$(basename "$target_file")" \
          -exec readlink -f {} \; | sed "s|^|$target_file <- |"
  }

  if [ "$#" -eq 0 ]; then
      echo "Usage: $0 -l|-d|-b <target>"
      exit 1
  fi

  option=""
  target_file=""

  while getopts ":ldb" opt; do
      case $opt in
          l)
              option="links"
              ;;
          d)
              option="disk"
              ;;
          b)
              option="both"
              ;;
          \?)
              echo "Invalid option: -$OPTARG"
              exit 1
              ;;
      esac
  done

  shift $((OPTIND - 1))
  target_file="$1"

  if [ -z "$target_file" ]; then
      echo "Usage: $0 -l|-d|-b <target_file>"
      exit 1
  fi

  case $option in
      links)
          find_links "$target_file"
          ;;
      disk)
          echo "Disk usage information for $target_file:"
          du -h -L "$target_file"
          ;;
      both)
          echo "Disk usage information for $target_file:"
          du -h -L "$target_file"
          echo
          find_links "$target_file"
          ;;
      *)
          echo "Invalid option: $option"
          exit 1
          ;;
  esac

''
