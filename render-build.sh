set -o errexit

# Webpack 4 relies on MD4, removed from OpenSSL 3 — required on Node >=17
export NODE_OPTIONS="--openssl-legacy-provider"

# Render ships Bun on PATH ahead of Node; ExecJS auto-selects it and Bun's
# CLI isn't ExecJS-compatible. Pin the runtime to Node for autoprefixer-rails.
export EXECJS_RUNTIME=Node

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
