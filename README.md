# Athene
<a href="https://zenhub.com"><img src="https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png"></a>

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
- [FFmpeg](http://trac.ffmpeg.org/wiki/CompilationGuide) version: ```2.8```
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
5. Deploy the application server by running ```rails s``` on the projects root directory.
6. The application will run by default on ```localhost:3000```.
7. If you wanna know if the application's running well, go to your internet browser and test by entering ```http://localhost:3000``` in your address bar.
8. If you want to host the application on a different IP or port, just run ```rails server -b $IP -p $PORT```.


#### Database clean Installation

1. after you did steps 1 ,2 and 3 of Instalation and execution, make sure you are in Athene root and enter these commands in command line

	```# rake db:drop:all ```

	```# rake db:create:all ```

2. Continue in Instalation and execution


### Testing Aplication
#### BDD
1. Go to the aplication root in your terminal(folder Athene)
2. Run ```bundle update``` to add gem tests dependencies(if you have already installed bundle then you can jump this step).
3. You will run the tests by just typing and enter ```cucumber``` in your terminal.
4. If you want to test only one feature than type and enter ```cucumber --tags @```<b>FEATURE_NAME</b> where <b>FEATURE_NAME</b> is the feature name that you want to test.  
#### TDD
1. Go to the aplication root in your terminal(folder Athene)
2. Run ```bundle update``` to add gem tests dependencies(if you have already installed bundle then you can jump this step).
3. You will run the tests by just typing ```rspec``` in your terminal.
4. If you want to run a specific test, you'll need to specify the test file directory , for example ```rspec spec/controller/```<b>CONTROLLER_NAME</b>```_spec.rb``` where <b>CONTROLLER_NAME</b> is the name of the controller that you want to test, or you can also test an entire entity by typing ```rspec spec/```<b>ENTITY_NAME</b> where <b>ENITY_NAME</b> is the name of the entity that you want to test(ex.:controllers,helpers,models,views,etc).
#### Coverage

If you run the tests correctly you can see the coverage in terminal output
Also you can see more detailed information about coverage in ```coverage``` aplication folder generated