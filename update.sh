#!/bin/bash
git submodule init
git submodule update --remote --rebase --depth 1
ruby_version=$(ruby -v | awk -F' |p' '{print $2}')
gem install bundler --install-dir "${PWD}/rails/.bundle"
RAILS_ENV=production ${PWD}/rails/.bundle/bin/bundle install --without doc job test --gemfile ${PWD}/rails/Gemfile --path "${PWD}/rails/.bundle"
RAILS_ENV=production BUNDLE_GEMFILE=${PWD}/rails/Gemfile ${PWD}/rails/.bundle/bin/bundle exec rake -f ${PWD}/rails/actioncable/Rakefile assets:compile
mv ${PWD}/rails/actioncable/lib/assets/compiled/action_cable.js ${PWD}/dist
rm -rf ${PWD}/rails/actioncable/lib/assets
# Install bundler if not already installed
# (which bundle > /dev/null) || gem install bundler
# Attempt at installing only the necessary gems
# (gem list rake -i > /dev/null) || gem install rake
# (gem list sprockets -i > /dev/null) || gem install sprockets
# (gem list coffee-script -i > /dev/null) || gem install coffee-script
