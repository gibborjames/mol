## MOL 
# Clone application 
git clone git@github.com:gibborjames/mol.git

# bundle it!
cd mol
bundle install

# copy database yml
configure your own username and password to database.yml
cp config/database.yml.sample config/database.yml

# Rake task
rake db:create db:migrate db:seed


# try to run on your local machine
rails server 

# sample user account
username: admin@example.com
password: password

username: user@example.com
password: password
