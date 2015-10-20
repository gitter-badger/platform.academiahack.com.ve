server '45.55.165.253', user: 'deploy', roles: %w{web app}, password: ENV["SSH_DEPLOY_PASS"]

role :app, %w{deploy@45.55.165.253}
role :web, %w{deploy@45.55.165.253}
role :db,  %w{deploy@45.55.165.253}

set :stage, :development
set :branch, 'development'

set :deploy_to, '/home/deploy/dev.platform.academiahack.com.ve'
