web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -t 25 --environment ${RACK_ENV:-development} -C config/sidekiq.yml