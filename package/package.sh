f() {
  ext=$1
  work_dir=$2
  list=$(find $work_dir | grep "$ext$")
  path=""
  for i in $list; do
    path=$i
  done
  echo "find podspec: $path"
  podspec_name=$(basename $path)
  framework_name=${podspec_name%$ext}

  installed=$(gem query --local | grep "cocoapods-xcframework")
  if [ -z "$installed" ]; then
    framework="\033[36mpod framework\033[0m"
    echo "Package require $framework but it's not installed."
    echo "You may install $framework use\033[36m sudo gem install cocoapods-xcframework \033[0m"
    echo "About $framework: \033[4mhttps://github.com/TyrantDante/cocoapods-xcframework\033[0m"
    return 0
  fi
  pod framework $path --no-static-library --enable-bitcode
  folder_name=$(ls -t | grep "$framework_name-" | head -n1)
  if [ -z "$folder_name" ]; then
    return 0
  fi
  framework_path="$(pwd)/$folder_name"
  
  list=$(find $framework_path | grep "\.framework$")
  for i in $list; do
    path=$i/$framework_name
    echo "\nCheck"
    echo "Framework: $path"
    result=$(otool -l $path)
    bitcode=$(otool -l $path | grep __LLVM | wc -l)
    bitcode_enable=$([ $bitcode -gt 0 ] && echo "yes" || echo "no")
    echo "bitcode enable $bitcode_enable"
    
    lines=(${result//'\n'/ })
    
    find=0
    for(( i=0;i<${#lines[@]};i++)) do
        line=${lines[i]}
        if [ $line == "__bundle" ]; then
            find=1
        fi
        if [ $find -eq 1 ] && [ $line == "size" ]; then
            find=0
            echo "bitcode section size: ${lines[i+1]}"
        fi
    done
  done
}

SCRIPTDIR="$(cd "$(dirname "$0")" && pwd)"

f ".podspec" $SCRIPTDIR
