# Athene

Athene is a simple web application which you can upload and see videos online, all via (live) streaming.

## Project info

### Database creation

1. Make sure you have postgres installed on your computer.
2. Install postgres gem interface with rails: run ```$ gem install pg```.
3. Set up postgres you can either run ```$ su - postgres``` or ```$ sudo -u postgres psql```.
4. Once you enter postgres command line create the database: ```# create role Athene with createdb login password 'athene';```.
5. Go back to your commando line and set up the database by running ```$ rake db:setup```.

### System requirements 

- Ruby version: ```2.4.1```
- Rails version: ```5.2.0```

### Instalation and execution

1. Clone the repository: ```git clone https://github.com/EngSwCIC/Athene.git```.
2. Run ```bundle install``` to manage dependencies.
3. Deploy the application server by running ```rails server``` on the projects root directory.
4. The application will run by default on ```localhost:3000```.
5. If you want to host the application on a different IP or port, just run ```rails server -b $IP -p $PORT```.
