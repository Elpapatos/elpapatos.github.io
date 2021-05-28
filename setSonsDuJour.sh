#!/bin/bash

git pull

while :; do
    read -ep 'Nombre de sons du jour (1-30) : ' number
    [[ $number =~ ^[[:digit:]]+$ ]] || continue
    (( ( (number=(10#$number)) <= 30 ) && number >= 1 )) || continue
    break
done

> sonsdujour.json

echo "[" >> sonsdujour.json

for i in $(seq 1 "$number") 
do
    read son
    echo "\"$son\"" >> sonsdujour.json
    if [ "$i" = "$number" ]; then
        continue
    else
        echo "," >> sonsdujour.json
    fi
done

echo "]" >> sonsdujour.json

if [[ `git status ./sonsdujour.json --porcelain` ]]; then
    echo "Fichié modifié, commit des changements..."
    git add ./sonsdujour.json
    git commit -m "Modification du fichier sonsdujour.json - `date +'%d/%m/%Y'`"
    git push
    echo "Fichié envoyé."
else
    echo "Le fichier sonsdujour n'a pas été modifié."
fi

echo "Sons du jour mis à jour, appyer sur une touche pour continuer..."
read nbrSonJour