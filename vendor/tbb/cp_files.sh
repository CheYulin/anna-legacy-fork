echo $1
cd $1
echo $(pwd)
var=build/$(ls build | grep "linux_.*gcc.**release" | head -n 1)
echo $var
cp $var/*.so* ./build