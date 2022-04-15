#2. Write a script called mybackup using for utility to create a backup of only #files in your home directory. 



echo please enter the direcotry that u want to backip all files on it 

read dir

current=$(pwd)

cd $dir

for file in *
 do
  if [ -d "$file" ]
    then
       continue
  else

        $(cp $file $file.bak)

   fi
done

echo Done successfully


cd $current
















