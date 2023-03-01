IFS=$(echo -en "\n\b")
for filename in $(ls input/)
do
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  echo
  echo -e ${RED}~= Converting $filename to 16-bit wav =~
  echo -e ffmpeg -i input/$filename -ar 16000 -ac 1 -c:a pcm_s16le temp/${filename%.*}.wav ${NC}
  ffmpeg -i input/$filename -ar 16000 -ac 1 -c:a pcm_s16le temp/${filename%.*}.wav
  echo
  echo -e ${RED}~= Transcribing $filename =~
  echo -e ./main -f temp/${filename%.*}.wav -otxt -of output/${filename%.*} ${NC} 
  
  ./main -f temp/${filename%.*}.wav -otxt -of output/${filename%.*}
  rm temp/${filename%.*}.wav
done;