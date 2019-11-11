#!/bin/sh
echo "Bundle check..."
bundle check || bundle install

echo "Initializing database..."
rails db:drop
rails db:create

echo "Migrating & seeding..."
rails db:migrate
rails db:seed

rm tmp/* -Rf

rails s -b 0.0.0.0
