#!/bin/bash

git pull

rm sons.json

rm sonsb.json

curl http://192.168.1.22/son -o sons.json
curl http://192.168.1.22/sonb -o sonsb.json

if [[ `git status ./sons.json --porcelain` ]]; then
    echo "Fichié modifié, commit des changements..."
    git add ./sons.json
    git commit -m "Modification du fichier sons.json - `date +'%d/%m/%Y'`"
    echo "Fichié envoyé."
else
    echo "Le fichier sons n'a pas été modifié."
fi

if [[ `git status ./sonsb.json --porcelain` ]]; then
    echo "Fichié modifié, commit des changements..."
    git add ./sonsb.json
    git commit -m "Modification du fichier sonsb.json - `date +'%d/%m/%Y'`"
    echo "Fichié envoyé."
else
    echo "Le fichier sonb n'a pas été modifié."
fi

git push
