#!/bin/sh

courbe_top()
{
var=$(top) 
echo "$var" > table.txt	# transferer les informations dans un fichier.txt
gnuplot script.gnu -persist	# afficher courbe en fonction du volume (size)
rm table.txt # supprimer le fichier.txt
}

courbe_ps()
{
var=$(ps)
echo "$var" > table.txt	# transferer les informations dans un fichier.txt
gnuplot script2.gnu -persist	# afficher courbe en fonction des espaces disponibles (available)
rm table.txt # supprimer le fichier.txt
}






while true
do
echo ""
echo "     Liste des processus     "
echo ""  
echo " 1) la commande -ltop"
echo " 2) la commande -lps"
echo " 3) la commande -user"
echo " 4) -h ou -help"
echo " 5) -mtop"
echo " 6) -plot"
echo " 7)  exit"
echo "  "
echo donner votre choix
read INPUT_STRING
case $INPUT_STRING in


  -ltop)
           echo "******"
		top
           echo "******"
      ;; 

  -lps)  echo "******"
           ps -aux
           echo "******"
      ;;

  -user) echo "******"
            top -u dorra 
            echo "******" 
      ;;
  -mtop) echo "******"
		top -o %CPU>20/
		top -n 5

            echo "******" 
;;
  -h)
            echo "******"
            echo "-ltop : afficher caracteristique hardware via top"
            echo "-lps : afficher caracteristique hardware via ps"
            echo "-user: afficher uniquement processus lancé par utilisateur "
            echo "-mtop: afficher uniquement 5 plus gourmand processus" 
            echo "******"  
     ;;
  -help)
            echo "******"
            echo "-ltop : afficher caracteristique hardware via top"
            echo "-lps : afficher caracteristique hardware via ps"
            echo "-user: afficher uniquement processus lancé par utilisateur "
            echo "-mtop: afficher uniquement 5 plus gourmand processus" 
            echo "******"  
     ;;

  -plot)
	echo "*******"
		courbe_top
		courbe_ps
	echo "*******"

   ;;
 
    
   exit)     echo "******"
             echo GoodBye
             echo "******"    
             exit
     ;;
    
    *)
       echo "******"
       echo choix incorrecte
       echo "******"
    ;;

 
esac
done
 
