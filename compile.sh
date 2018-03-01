currDir=$(dirname $0)
outFile=$currDir/cydo.out

rm -f $outFile     
xcrun --sdk iphoneos gcc -arch arm64 -framework Foundation $currDir/*.c -o $outFile

if [ ! -e $outFile ]; then
  echo 'Error compiling.'
  exit
fi

jtool --sign sha1 --inplace --ent $currDir/ent.plist $outFile
sudo chown root:wheel $outFile     
sudo chmod 6755 $outFile     
echo 'Done.'
