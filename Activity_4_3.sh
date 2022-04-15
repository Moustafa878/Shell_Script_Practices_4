#3. Design script that used to reset user password
#- You will get the user id
#- If user id no exist ask him to re-enter valid id, if exist
#- Ask user to enter old password if right ask him for new password and then upd#ate it to the DB, if not ask him to re-enter the right old password.


function check_id(){

if [ $(cut -d ':' -f1 DB|grep -w $1) ]
 then
   return $TRUE
 else
   return $FALSE
fi
}

function check_old_pass(){

if [ $(sed -n "/^$1/p" DB |cut -d':' -f3|grep -w $2) ]
 then
  return $TRUE
 else
    return $FALSE
fi

}


function change_pass(){

$(sed -n "/^$1/p" DB |cut -d':' -f3|grep -w $2 |sed -i "s/$2/$3/1" DB)

echo done

}

while true
do
 while true

   do
     echo Please enter ur ID :
     read id

     check_id $id
     out=$?

     if (($out == 0)) 
       then
        echo true
        break
     else
        echo fales ,try again
        continue
     fi
 done
 while true
   do
   echo Please enter the old password :
   read opass
   check_old_pass $id $opass
   out=$?

   if (($out == 0))
       then
        echo true
        break
    else
        echo fales ,try again
        continue
     fi

 done

 while true
  do
    echo Please enter the new password :
    read npass
    change_pass $id $opass $npass
    out=$?
    if (($out == 0))
       then
        echo true
        break
    else
        echo fales
        continue
     fi
  done
echo updated successfully .

cat DB

echo if u want to break press ctrl+c or press enter to continue
read
done

