#1. Write a script called mychmod using for utility to give execute permission to #all files in your home directory. 

echo please enter the direcotry that u want to give all files on it execute permission

read dir

current=$(pwd)

cd $dir

for file in *
 do
  if [ -d "$file" ]
    then
       continue
  else
     
        $(chmod 111 $file)   

   fi
done

echo Done successfully 

cd $current
