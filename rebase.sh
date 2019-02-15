#!/bin/bash

PROJDIR="/home/andre.silva/Projetos/nome_do_projeto"
BRANCHES=("fs/feature_branch_1" "fs/feature_branch_2" "fs/feature_branch_3" "fs/feature_branch_n")

cd $PROJDIR

#Passo 01 - Fazer checkout e resetar a branch base
git checkout $1
git fetch
git reset --hard origin/$1

#Passo 02 - Fazer o merge da feature branch com a branch base

for branch in "${BRANCHES[@]}"
do
  git checkout $branch
  git reset --hard origin/$branch
  git rebase $1
  git checkout $1
  git rebase $branch
done

git tag -a `date +%Y-%m-%d` -m `date +%Y-%m-%d`
