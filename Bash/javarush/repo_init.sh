#!/bin/bash
cd src
echo "# Content" > README_JAVARUSH.md
echo "## javarush-collections repo" >> README_JAVARUSH.md
echo "This repository on https://github.com/MaxHard2017/javarush-collections.git" >> README_JAVARUSH.md
echo "contains  javarush.com tasks for level 3 *Colllections* course" >> README_JAVARUSH.md
echo " - Last pakage name - tasak number" >>README_JAVARUSH.md
echo " - Solution.java - unified class name of each task" >> README_JAVARUSH.md

cp ~/projects/Batch/Gitscripts/Javarush/Templates/{.,}* .

git init
git branch -M main
git add README_JAVARUSH.md
git add license.md
git commit -m " First commit - readme & license"
git remote add origin https://github.com/MaxHard2017/javarush-collections.git
git push origin main
git branch -u origin/main
