{ pkgs, lib, ... }:

let
_ = lib.getExe;
in 

pkgs.writeShellScriptBin "a" ''

usage() {
    echo "Usage: $0 [OPTIONS] <input_file> [output_file]"
    echo "Options:"
    echo "  -e, --extra-audio   Extract audio from video"
    echo "  -c, --comp-vid      Compress video"
    echo "  -a, --comp-aud      Compress audio"
    echo "  -h, --help          Display this help message"
    exit 1
}

DEFAULT_OUTPUT_EXTENSION=".mp4"
OUTPUT_FILE="output"

while [[ $# -gt 0 ]]; do
    case $1 in
        -e|--extra-audio)
            EXTRA_AUDIO=true; OUTPUT_EXTENSION=".mp3"; shift ;;
        -c|--comp-vid)
            COMPRESS_VIDEO=true; OUTPUT_EXTENSION=".mp4"; shift ;;
        -a|--comp-aud)
            COMPRESS_AUDIO=true; OUTPUT_EXTENSION=".mp3"; shift ;;
        -h|--help)
            usage ;;
        *)
            break ;;
    esac
done

[[ $# -lt 1 ]] && { echo "Error: Input file not specified."; usage; }
INPUT_FILE="$1"
[[ $# -eq 2 ]] && OUTPUT_FILE="$2"
OUTPUT_FILE="$OUTPUT_FILE''${OUTPUT_EXTENSION:-$DEFAULT_OUTPUT_EXTENSION}"

if [ "$EXTRA_AUDIO" = true ]; then
    ffmpeg -i "$INPUT_FILE" -vn -acodec mp3 -ab 256k "$OUTPUT_FILE"
    echo "Audio extracted successfully to $OUTPUT_FILE"
fi

if [ "$COMPRESS_VIDEO" = true ]; then
    ffmpeg -i "$INPUT_FILE" -vcodec libx264 -crf 23 "$OUTPUT_FILE"
    echo "Video compressed successfully to $OUTPUT_FILE"
fi

if [ "$COMPRESS_AUDIO" = true ]; then
    ffmpeg -i "$INPUT_FILE" -acodec libmp3lame -ab 128k "$OUTPUT_FILE"
    echo "Audio compressed successfully to $OUTPUT_FILE"
fi

exit 0


''
