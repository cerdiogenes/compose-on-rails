#!/bin/bash
# --force overrides README.md, .gitignore and Gemfile
rm -rf .git
rm .gitignore
docker-compose run web rails new . --force --database=postgresql --skip-bundle
sudo chown -R $USER:$USER .
mv spring_client.rb config/
mv database.yml config/
docker-compose run web bundle
docker-compose run web bundle exec spring binstub --all
