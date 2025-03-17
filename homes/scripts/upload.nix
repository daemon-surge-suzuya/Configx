{ pkgs, lib, ... }:

let
_ = lib.getExe;
in

pkgs.writeShellScriptBin "upload" ''
DEFAULT_EXPIRES=1

if [ -z "$1" ]; then
  echo "Usage: $0 <file> [expiration_in_hours]"
  exit 1
fi

FILE="$1"
EXPIRES="''${2:-$DEFAULT_EXPIRES}"

if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found!"
  exit 1
fi

FILE_SIZE=$(du -h "$FILE" | cut -f1)
notify-send "File Upload Started" "File size: $FILE_SIZE"

RESPONSE=$(curl -F "file=@$FILE" -F "expires=$EXPIRES" https://0x0.st)

if [ -n "$RESPONSE" ]; then
  echo "File uploaded successfully!"
  echo "Link: $RESPONSE"
  echo -n "$RESPONSE" | xclip -selection clipboard
  dunstify "Upload Successful" "The link has been copied to your clipboard."
else
  dunstify "Upload Failed!" "Error: Failed to upload file."
  exit 1
fi


''
