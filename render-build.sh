set -o errexit

# Webpack 4 relies on MD4, removed from OpenSSL 3 — required on Node >=17
export NODE_OPTIONS="--openssl-legacy-provider"

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
