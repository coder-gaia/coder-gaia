#!/bin/bash

# Quantidade de dias para fazer commit
total_days=365

# Loop para criar commits em dias diferentes
for i in $(seq 1 $total_days); do
  # Defina a data do commit
  date=$(date --date="$i days ago" +"%Y-%m-%d")

  # Crie um arquivo temporário e adicione algum conteúdo
  echo "$date" > "commit.md"

  # Adicione, faça commit e modifique a data do commit
  GIT_AUTHOR_DATE="$date 12:00:00" GIT_COMMITTER_DATE="$date 12:00:00" git add commit.md
  GIT_AUTHOR_DATE="$date 12:00:00" GIT_COMMITTER_DATE="$date 12:00:00" git commit -m "Snake game $date"

  # Altere o arquivo para evitar commits idênticos
  rm commit.md
done

# Empurre os commits para o GitHub
git push origin main
