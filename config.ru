# This file is used by Rack-based servers to start the application.
if ENV['RAILS_ENV'].to_s.eql?('production')
  # Unicorn self-process killer
  require 'unicorn/worker_killer'

  # Max requests per worker
  use Unicorn::WorkerKiller::MaxRequests, 1024, 2048

  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, (192*(1024**2)), (256*(1024**2))
end

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == ENV['AUTH_USER'] && password == ENV['AUTH_PASS']
  end
end