task :q do
  sh('rake')
  sh('bundle exec rubocop')
  sh('bundle exec rails_best_practices')
end
