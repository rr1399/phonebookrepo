#!/bin/sh
while :
do
clear
echo "PHONE-BOOK-APPLICATION"
echo "1.Add New Name"
echo "2.Search By Name"
echo "3.List of contacts"
echo "4.Delete contact"
echo "5.Delete Phonebook"
echo "6.EXIT"
read -p "Enter Your Choice" ent_no
clear
case $ent_no in
        1)echo"ADD new Contact"
          read -p "Enter the name:" name
          read -p "Enter the number:" num
          echo "$name : $num" >> phonebook.log;;
        2)echo"Search Contacts"
          read -p "Enter the name to be searched:" search_name
          grep -i $search_name phonebook.log;;
        3)echo"List Of Contacts:"
          if [ -s phonebook.log ]
          then
          cat phonebook.log
          else
          echo "No Contacts are entered"
          fi;;
        4)echo "DELETE a contact"
          read -p "Enter contact name to delete " delete_name
          sed -i -e "/$delete_name/d" phonebook.log
          echo "$delete_name Deleted from Log";;
        5)echo "Delete PhoneBook"
          rm -r phonebook.log;;
        6)break;;
        *)echo"Enter options from 1 to 6, Please";;
esac;
read -p "Enter to go back to MENU or 6 to Exit " quit
if [ $quit -eq 6 ]
then break
fi
done
