server '45.55.172.121', user: 'deploy', roles: %w{web app}

role :app, %w{deploy@45.55.172.121}
role :web, %w{deploy@45.55.172.121}
role :db,  %w{deploy@45.55.172.121}

set :stage, :production
set :branch, 'master'

server '45.55.172.121', user: 'deploy', roles: %w{web app}

set :deploy_to, '/home/deploy/platform.hack4geeks.co'
