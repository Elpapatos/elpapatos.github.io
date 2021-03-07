#!/bin/bash

git pull

rm sons.json

curl http://192.168.1.22/son -o sons.json

if [[ `git status ./sons.json --porcelain` ]]; then
    echo "Fichié modifié, commit des changements..."
    git add ./sons.json
    git commit -m "Modification du fichier sons.json - `date +'%d/%m/%Y'`"
    git push
    echo "Fichié envoyé."
else
    echo "Le fichier Music n'a pas été modifié."
fi
