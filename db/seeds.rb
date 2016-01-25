
AdminUser.create email:'admin@academiahack.com.ve', password:'Hack2015'
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }