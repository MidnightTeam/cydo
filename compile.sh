currDir=$(dirname $0)

rm -f $currDir/cydo
xcrun --sdk iphoneos gcc -arch arm64 -framework Foundation $currDir/cydo.c -o $currDir/cydo
jtool --sign sha1 --inplace --ent $currDir/ent.plist $currDir/cydo
sudo chown root:wheel $currDir/cydo
sudo chmod 6755 $currDir/cydo
echo 'Done.'
