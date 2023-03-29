#!/bin/bash
echo ""
echo "git repo check:"
echo ""
echo "repo: ~/projects/Javarush/JavaCollections/src"
echo "---------------------------------------------"
echo "checking git status..."
cd ~/projects/Javarush/JavaCollections/src
git fetch
git status
echo ""
echo "repo: ~/projects/Javarush/JavaCore/src"
echo "--------------------------------------"
echo "checking git status..."
cd ~/projects/Javarush/JavaCore/src
git fetch
git status
echo ""
echo "repo: ~/projects/Javarush/JavaSyntax/src"
echo "----------------------------------------"
echo "checking git status..."
cd ~/projects/Javarush/JavaSyntax/src
git fetch
git status
echo ""
echo"repo: ~/Documents/Notes"
echo "-----------------------"
echo "checking git status..."
cd ~/Documents/Notes
git fetch
git status
echo ""
echo "repo: ~/Scripts"
echo "---------------"
echo "checking git status..."
cd ~/Scripts
git fetch
git status
