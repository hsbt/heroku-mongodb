# heroku-mongodb

tiny wrapper for mongodb

## Installation

```
$ heroku plugins:install git://github.com/hsbt/heroku-mongodb.git
```

## Usage

### MongoHQ

```
$ heroku mongohq:dump tmp/production

$ heroku mongohq:restore tmp/production/app12345
```

### MongoLab

```
$ heroku mongolab:dump tmp/production

$ heroku mongolab:restore tmp/production/app12345
```
