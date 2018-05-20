# Athene

Athene is a simple web application which you can upload and see videos online, all via (live) streaming.
The purpose of this application is to provide a light streaming platform with the least bureaucracy.

## Project info

### System requirements

For the application to run it is necessary that you have installed on your computer,
preferably Linux or OSX, Git developer tools, Ruby and Rails (versions are specified below).
Also, [PostgreSQL](https://www.postgresql.org/download/) is required for developers.

- [Github](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) version: ```2.4.1```
- [Ruby gems](https://rubygems.org/pages/download) version: ```2.6```
- [Rails](http://installrails.com/) version: ```5.2.0```

### Database creation

1. Make sure you have postgres installed on your computer.
2. Install postgres gem interface with rails: run ```$ gem install pg```.
3. Set up postgres you can either run ```$ su - postgres``` or ```$ sudo -u postgres psql```.
4. Once you enter postgres command line create the database: 
```# create role athene with createdb login password 'athene';```

   or you can also create by these commands:

   ```# create user athene with password 'athene';```

   ```# create database athene owner athene;```

   ```# alter user athene superuser createrole createdb replication;```.

5. Go back to your commando line and set up the database by running ```$ rake db:setup```.

### Instalation and execution

1. Clone the repository: ```git clone https://github.com/EngSwCIC/Athene.git```.
2. Enter the project directory ```cd Athene```.
3. Run ```bundle install``` to manage dependencies.
4. If running for the first time create the database and migration
   ```bundle exec rake db:create``` and ```bundle exec rake db:migrate```.
5. Deploy the application server by running ```rails server``` on the projects root directory.
6. The application will run by default on ```localhost:3000```.
7. If you want to host the application on a different IP or port, just run ```rails server -b $IP -p $PORT```.
