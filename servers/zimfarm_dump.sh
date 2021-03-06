#!/bin/sh

ZIM2INDEX=/srv/upload/zim2index/
SCRIPT=`readlink -f $0/../`
SCRIPT_DIR=`dirname "$SCRIPT"`
MWOFFLINER="$SCRIPT_DIR/mwoffliner.js --verbose --skipCacheCleaning --adminEmail=kelson@kiwix.org --format= --format=nopic"
MWMATRIXOFFLINER="$SCRIPT_DIR/mwmatrixoffliner.js --speed=5 --verbose --adminEmail=contact@kiwix.org --mwUrl=https://meta.wikimedia.org/ --skipCacheCleaning"

# Wikivoyage all in english
$MWOFFLINER --speed=5 --mwUrl="https://en.wikivoyage.org/" --parsoidUrl="https://en.wikivoyage.org/api/rest_v1/page/html/" --customMainPage="Wikivoyage:Offline_reader_Expedition/Home_page" --outputDirectory=$ZIM2INDEX/wikivoyage/ &&

# Wikivoyage europe in english
/srv/kiwix-tools/tools/scripts/listCategoryEntries.pl --host=en.wikivoyage.org --path=w --exploration=8 --namespace=0 --category="Europe" | sort -u > europe &&
$MWOFFLINER --customZimTitle="Wikivoyage - Europe" --speed=5 --articleList=europe --mwUrl="https://en.wikivoyage.org/" --parsoidUrl="https://en.wikivoyage.org/api/rest_v1/page/html/" --customMainPage="Wikivoyage:Offline_reader_Expedition/Europe_Home_page" --outputDirectory=$ZIM2INDEX/wikivoyage/ &&

# Wikipedia in Hebrew
$MWOFFLINER --speed=5 --mwUrl="https://he.wikipedia.org/" --parsoidUrl="https://he.wikipedia.org/api/rest_v1/page/html/" --customMainPage="ויקיפדיה:עמוד_ראשי/לא-מקוון" --outputDirectory=$ZIM2INDEX/wikipedia/ &&

# Wikipedia in French
$MWOFFLINER --speed=5 --mwUrl="https://fr.wikipedia.org/" --parsoidUrl="https://fr.wikipedia.org/api/rest_v1/page/html/" --customMainPage="user:Popo_le_Chien/Kiwix" --outputDirectory=$ZIM2INDEX/wikipedia/ &&

# Wikipedia in English
$MWOFFLINER --speed=5 --mwUrl="https://en.wikipedia.org/" --parsoidUrl="https://en.wikipedia.org/api/rest_v1/page/html/" --customMainPage="user:Popo_le_Chien/Kiwix" --outputDirectory=$ZIM2INDEX/wikipedia/ &&

# Wikipedia in Spanish
$MWOFFLINER --speed=5 --mwUrl="https://es.wikipedia.org/" --parsoidUrl="https://es.wikipedia.org/api/rest_v1/page/html/" --customMainPage="user:Popo_le_Chien/Kiwix" --outputDirectory=$ZIM2INDEX/wikipedia/ &&

