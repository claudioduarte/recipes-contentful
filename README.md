# Recipes from Contentful

Fetching and Displaying Recipes from Contentful API

## Prerequisites

The setups steps expect following tools installed on the system.

- PostgreSQL 14
- Ruby 3.2.2
- Rails 7.0.4.3
- Puma 5

## Installation

#### 1. Clone the repository

```bash
git clone https://github.com/claudioduarte/recipes-contentful.git
```

or, if you prefer, via SSH (recommended)

```bash
git clone git@github.com:claudioduarte/recipes-contentful.git
```

#### 2. `cd` into the project

```ruby
cd recipes-contentful
```

#### 3. Add the `master.key` to the `config` folder to decrypt Rails credentials

(Available upon request)

#### 4. Install Homebrew

```ruby
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
````

If you run into problems after the installation, please run the following commands:

```ruby
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/[your_user]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 5. Install Ruby using `rbenv`

```ruby
brew install rbenv
```

Add the following command to your ~/.zshrc file to make rbenv load automatically when you open up the Terminal.

```ruby
eval "$(rbenv init -)" >> ~/.zshrc
```

Install Ruby 3.2.2 with the following command:

```ruby
rbenv install 3.2.2
```

Set the ruby version in the project, rehash and then restart the terminal to apply the changes

```ruby
rbenv local 3.2.2
rbenv rehash
```

When typing `ruby -v`, this should be the version:

```ruby
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin21]
```

#### 6. Install PostgreSQL with Homebrew

```ruby
brew install postgresql@14
```

#### 7. Install Bundler gem

```ruby
gem install bundler -v '2.4.12'
```

#### 8. Install all of your gem dependencies

```ruby
bundle install
```

If an error occurs, run command with `sudo` permissions
```ruby
sudo bundle install
```

#### 9. Start PostgreSQL in your local machine if not yet running

```ruby
brew services start postgresql@14
```

#### 10. Create and setup the database

```ruby
bundle exec rake db:create
```

#### 11. Run migrations

```ruby
bundle exec rake db:migrate
```

#### 12. Start the Rails server in development mode

```ruby
rails s
```

#### 13. View the project

You can visit the website using the following URL: [http://localhost:3000](http://localhost:3000)

#### 14. Run RSpec Tests

```ruby
rspec -fd
```

## License & Copyright

Licensed under the [MIT License](LICENSE). ©2023 Cláudio Duarte