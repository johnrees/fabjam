require File.expand_path('../application', __FILE__)
require "bundler/capistrano"

set :bundle_flags,   "--deployment --verbose --without development test"

set :rails_env, "production"
set :recipes, "config/recipes"

%w(base postgresql logs figaro nginx logs unicorn security check).each do |r|
  load "#{recipes}/#{r}"
end

server ENV['APP_SERVER'], :web, :app, :db, primary: true
set :port, ENV['SSH_PORT']
set :application, "fabjam"
set :user, ENV['DEPLOY_USER']
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rake, "#{rake} --trace"
set :scm, "git"
set :repository, "git@github.com:johnrees/#{application}.git"
set :branch, "master"
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

after "deploy", "deploy:cleanup" # keep only the last 5 releases


require './config/boot'
