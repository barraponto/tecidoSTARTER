#!/bin/bash

#change the variables to suit your project
PROJECT="tecidoSTARTER"
#prefix the first argument for the feature name
FEATURE="${PROJECT}_${1}"

#if the folder isn't there, create it
if [ ! -d modules/$PROJECT ]; then
  mkdir modules/$PROJECT 
fi

#now copy, rename and sed the new feature
cp -r tecidoSTARTER_feature modules/$PROJECT/$FEATURE
rename "s/tecidoSTARTER_feature/$FEATURE/" modules/$PROJECT/$FEATURE/*
sed -i "s/tecidoSTARTER_feature/${FEATURE}/g" modules/$PROJECT/$FEATURE/*
sed -i "s/TecidoSTARTER/${FEATURE}/g" modules/$PROJECT/$FEATURE/*
