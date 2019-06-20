# Laravel

This is a Laravel project!

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes. See deployment for notes on
how to deploy the project on a live system.

### Prerequisites

-   GNU Make >= 3.81
-   PHP >= 7.4
-   PostgreSQL >= 12.1
-   Node.js >= 13.3

### Installation

```
# clone the repository
git clone git@github.com:nianwang/laravel.git laravel

# go to the project directory
cd laravel
```

### Configure Environment

```
# install dependencies
make install

# create database
createdb laravel

# run the initial migration and seed
php artisan migrate:fresh --seed
```

## Development

For local development, the following commands are available:

```
# alias for `make help`
make

# build all assets
make build

# clear generated files
make clean

# build all assets for distribution (production)
make dist

# watch for file changes and open a browser testing session
make watch
```

### Coding style and tests

Prettier is an opinionated code formatter to help maintain a consistent looking
codebase. It supports all the popular editors including Vim, VS Code, Atom, and
Sublime Text.

Code format settings are available in _.prettierrc.json_ in the project root.

Together with [husky](https://github.com/typicode/husky),
[pretty-quick](https://github.com/azz/pretty-quick) is used to check formatting
for changed/staged files as a pre-commit hook.

### Database Notes

Quickly freshen your database:

```
php artisan migrate:fresh --seed
```

After, to seed data successfully, register classes and clear caches:

```
composer dump-autoload
php artisan db:seed --class ExampleSeeder
php artisan cache:clear
```

## Deployment

For local development, you can run:

```
php artisan serve
```

Alternatively, use [hotel](https://github.com/typicode/hotel) to manage the process:

```
# to add the process
hotel add 'php artisan serve --port=$PORT'

# to load the website
open http://localhost:2000/laravel

# (or with SSL and automatic proxy configuration enabled)
open https://laravel.localhost
```
