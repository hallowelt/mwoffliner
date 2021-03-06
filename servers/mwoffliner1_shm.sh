#!/bin/sh

ZIM2INDEX=/srv/upload/zim2index/
SCRIPT=`readlink -f $0/../`
SCRIPT_DIR=`dirname "$SCRIPT"`
MWOFFLINER="$SCRIPT_DIR/mwoffliner.js"
MWMATRIXOFFLINER="$SCRIPT_DIR/mwmatrixoffliner.js --speed=5 --verbose --skipHtmlCache --adminEmail=contact@kiwix.org --mwUrl=https://meta.wikimedia.org/ --cacheDirectory=/data/scratch/mwoffliner/cac/ --tmpDirectory=/dev/shm/ --skipCacheCleaning"

# Wikibooks
$MWMATRIXOFFLINER --project=wikibooks --deflateTmpHtml --outputDirectory=$ZIM2INDEX/wikibooks/ &&

# Wikispecies
$MWMATRIXOFFLINER --project=species --outputDirectory=$ZIM2INDEX/wikispecies/ &&

# Wikisource
$MWMATRIXOFFLINER  --project=wikisource --outputDirectory=$ZIM2INDEX/wikisource/ --language="(en|fr)" --languageInverter --deflateTmpHtml &&

# Wikivoyage
$MWMATRIXOFFLINER --project=wikivoyage --outputDirectory=$ZIM2INDEX/wikivoyage/ --languageInverter --language="(en)" &&

# Wikiquote
$MWMATRIXOFFLINER --project=wikiquote --outputDirectory=$ZIM2INDEX/wikiquote/ &&

# Wikiversity
$MWMATRIXOFFLINER --project=wikiversity --outputDirectory=$ZIM2INDEX/wikiversity/ &&

# Wikipedia
$MWMATRIXOFFLINER --deflateTmpHtml --project=wiki --outputDirectory=$ZIM2INDEX/wikipedia/ --languageInverter --language="(ar|bg|ceb|cs|da|de|el|en|eo|eu|et|es|fi|fr|gl|hu|hy|hi|hr|it|ja|kk|ms|min|nl|nn|no|ro|simple|sk|sl|sr|sh|tr|pl|pt|ru|sv|vi|war|fa|ca|ko|id|he|la|lt|uk|uz|zh)"
