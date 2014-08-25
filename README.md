# Base Application

> This is the README for the Base Application. You **NEED** to modify this for your application's README.

This application's  purpose is to provide a Base from which you can easily create demos, or as a starting point for your application development. Ideally, the flow is:

1. Clone the application repository.
  -  The Master branch README should have additional information on what feature branches are available. Think or
    README updates on master as *hotfixes*.
2. Bundle, setup database, change application configuration in application.yml
3. Start hacking

Also, the application should show how to do important tasks such as:

1. How to test
2. How to debug
3. How to deploy

This README should provide enough information to get beginner developers started immediately. If you find any need for
improvement, please inform your development manager.

# Getting Started

## Setup from git clone

The project has a .ruby_version file specifying 2.1.2 (as of august 6, 2014). We use rbenv for managing different rubies.

Change directory into the project, then:

```
gem install bundler
rbenv rehash
bundle install
rbenv rehash
```

Create your database.yml. There is a config/database.yml.template file that you can copy and modify. (The project uses postgres and postgres extensions, so you must use postgres)

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

The last step populates the DB with the 'sysad@base.com' user, with password 'password'.

You can start hacking already see the section about scaffold below.

## Vagrant Setup

You only need this if you do not have a ful development stack locally, or if you want an environment similar to production.

Install [`VirtualBox`](https://www.virtualbox.org/wiki/Downloads) and [`Vagrant`](http://www.vagrantup.com/downloads.html). Install additonal plugins required by doing the following in a terminal:

```
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-berkshelf --plugin-version '>= 2.0.1'
```

That installs Chef on the guest, updates the Guest Additions, and enables Chef Solo to use Berkshelf for the cookbooks.
Start the development environment by:

```
vagrant up
```

When the VM is run for the first time, it is provsioned with [Chef Solo](http://docs.vagrantup.com/v2/provisioning/chef_solo.html). Provisioning takes a lot of time because packages are downloaded and updated. Among those installed on top of the base box are: chef, ruby (through rbenv), postgresql. Login to the
vm through:

```
vagrant ssh
```

Go the the shared folder to access the repo.

```
cd /vagrant
bundle install
```

## Scaffolding

To create project resources that you can CRUD, use scaffolding:

```
bundle exec rails g scaffold item code:index query:index category_id:integer:index description --no-stylesheets
bundle exec rake db:migrate
```

Then add some test data to db/seeds.rb for development.

```
1.upto(99) do |i|
  Item.create(
  code:        Faker::Number.number(10),
  query:       Faker::Number.number(6), 
  category_id: 1,
  description: Faker::Commerce.product_name
  )
end
```

When you modify the seeds, you need to do a reset:

```
bundle exec rake db:reset
```

### Controller

Things to check after scaffold:

* Check the list of search parameters permitted.

### View

Things to check after scaffold:

* Modify the search form to include only meaningful filters
* Modify the index table for appropriate columns.
* Modify the form to use appropriate types

### Model

Things to check after scaffold:

* Setup the associations to other models
* Implement the needed validations.

## Committing your changes

### When you have changes that have not been committed yet

> Example shows working on `master`, but please do not work on `master` directly.
> Work off the branch `develop`. See Branching Strategy.

Use `git stash`.

For example, you are currently working on the branch `master`, and there are more recent commits on the remote that you do not have yet on your local.

`git status` should show your changes, and there are no other commits and you are up-to-date with `origin/master`.

```
Edwins-MacBook-Air:Crosspoint emogul$ git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

`git diff` will let you review your changes. Its a good idea to clean them up so that you know you are in a good state.

Save your changes with `git stash`

```
Edwins-MacBook-Air:Crosspoint emogul$ git stash
Saved working directory and index state WIP on master: d2a61b6 update README with setup instructions
HEAD is now at d2a61b6 update README with setup instructions
Edwins-MacBook-Air:Crosspoint emogul$ git stash list
stash@{0}: WIP on master: d2a61b6 update README with setup instructions
Edwins-MacBook-Air:Crosspoint emogul$ git status
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean
```

Pull the repo, then re-apply your changes

```
Edwins-MacBook-Air:Crosspoint emogul$ git stash list
stash@{0}: WIP on master: d2a61b6 update README with setup instructions
Edwins-MacBook-Air:Crosspoint emogul$ git stash pop stash@{0}
On branch master
Your branch is up-to-date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
Dropped stash@{0} (17728e52996e6e12a8c42a40a9fbf70398bdddba)
```

Then you can commit and push, your changes will be at the tip.

# Requirements

## We generally do not build on Windows.

If there is a need for this, maybe we can consider a JRuby build.

For designers, documenters, and business analysts, you can use Vagrant on Windows. Vagrant will allow you to run the application, while still being able to do work (e.g., edit files, create graphics, etc.) on Windows.

Please consult your development manager if this project does not provide a Vagrant environment.

## Catching Mail

Email notifications is a common feature in web-based business applications. In order to test and demonstrate this email capability, we use [Mailcatcher](http://mailcatcher.me/) in the development environment.

Mailcatcher is not recommended to be in the Gemfile as it will conflict with the application at some point. Simply install it with `gem install mailcatcher`, then run `mailcatcher` on your terminal. You can view the emails by going to `http://localhost:1080` in your web browser.

For Vagrant users, this may already be setup. Consult your development manager.

# How this applicaton was built

Here is the sequence use in building this application

- Install latest Ruby. I am using RBENV, you shoud too.
  - In case you are using RVM, here is a link how to switch:
    [Switch from RVM to RBENV](http://www.codinghell.ch/blog/2013/05/24/migrate-from-rvm-to-rbenv/)
- Install the latest Rails (in this case it is v.4.1.2, then upgraded to 4.1.4) with `gem install rails`
- Generate a new Rails project
  - `rais new base --skip-unit-tests --database=postgresql`
  - We use `--skip-unit-tests` because we will be using RSpec
  - We use `--database=postgresql` just to generate the template database.yml to guide us through. Modify your
    database.yml to suit your environment. (**[TODO]:** Provide hints on the Vagrant/Mac/Ubuntu setup.)
- Added `haml-rails` gem. This will enable us to use HAML, and haml-aware generators can generate haml directly.
- Added `bootstrap-sass` and `autoprefixer-rails` to provide the Bootstrap 3 files in the assest pipeline.
- Added `settingslogic` to provide application configuration functionality.
- Added `bundler-audit` for checking gems against vulnerability advisories.
- Added `rspec-rails`, `factory_girl_rails`, `capybara`, `spring-commands-rspec`, `guard-rspec`, and `database_cleaner`
  - bundle exec rails g rspec:install
    - uncomment the recommended configuration in `spec_helper.rb`.
    - add databse cleaner strategy to `rails_helper.rb`.
    - add `require capybara/rails` and `require capybara/rspec` to `rails_helper.rb`.
    - remove `--warnings` from the `.rspec` file, or you will be flooded with warnings!
  - bundle exec spring binstub --all
  - bundle exec guard init
  - Edit Guardfile, change command for rspec to `cmd: "bundle exec spring rspec"`
- Added `simplecov`
  - added to `.gitignore`
  - added simplecov call to `spec_helper.rb`. Added report name to support spring. (**[TODO]**: Do these for spinach also)
- Added `devise`
  - `rails g devise:install`
  - configured the devise initializer
  - `bundle exec rake db:create`
  - `bundle exec rails g migration EnableUuidOsspExtension`. Enable the postgres extensions, see below.
  - `bundle exec rails g scaffold User first_name:index last_name:index email:index status:integer:index --no-stylesheets`
  - Change to UUID, see below.
  - Provide the mapping for status, see below.
  - `bundle exec rake db:migrate`
  - `bundle exec rails generate devise User` and edit the `add_devise_to_users` migration file.
    - Remove the creation of the email field and its index. See configuring devise user model below.
  - Set ActionMailer settings. See below.
  - Create the user's dashboard. See below.
  - put `before_action :authenticate_user!` in your application contoller.
  - `rails generate devise:views`
- Add `rails_layout` gem and bundle
  - `rails generate layout:install bootstrap3 --force`
  - `rails generate layout:navigation --force`
  - `rails generate layout:devise bootstrap3`
- install mailcatcher and run it
- `rake db:seed`
- `bundle exec rails s`
- added `spinach-rails`, `spring-commands-spinach` and `guard-spinach` gems
  - `bundle exec rails generate spinach`
  - Uncommented the DatabaseCleaner code in `env.rb`.
  - Add the `Guardfile` snippet for spinach.
- added simple_form
  - `rails generate simple_form:install --bootstrap`
  - should have installed this first before scaffolding user
  - customized the 2 simple_form initializers
  - customized the form, and the layout
  - customized scaffold templates
  - `bundle exec rails g scaffold item code:index query:index category_id:integer:index description --no-stylesheets`
- added cancan
  - generated ability.rb
  - added roles to configuration file `config/application.yml`
  - added a migration for roles_mask essentially an integer bitfield comparable to enum, but permits multiple roles
  - implemented the roles acccessors in User
  - implemented inline checkboxes for Bootstrap 3 in form
  - implemented a helper in UsersHelper to display roles
  - added the roles array to permitted params `params.require(:user).permit(:first_name, :last_name, :email, :status, :roles =>[])`
    - the array designation is important, see https://github.com/rails/strong_parameters
  -
- added pry
- added pagination
  - gem 'kaminari'
  - gem 'bootstrap-kaminari-views'
  - modifed templates for controller and index view
- added gem 'ransack'
  - modified controller template for query
  - modified index template for column sorting
  - TODO: add search queries for user as sample
- fix the scaffold templates
  - check how vaidation errors handled
  - instructions how to scaffold
    - search parameters, search form
- added i18n-tasks
  - config, integrated with rspec
- added public_activity
  - bundle exec rails g public_activity:migration
  - the generated migration file does not have an .rb extension. rename it
  - change the belongs to to uuid id and string type
  - bundle exec rake db:migrate
  - Include PublicActivity::Model and add tracked to the model you want to keep track of:
  - include PublicActivity::StoreController in ApplicationController
  - Include PublicActivity::Common
  - added create_activity when user is created or updated
  - added activity feed (all) in dashboard
  - disable public activity tracking in seeds and tests
- scaffold the cancan demo
- cancan demo - users filter, user can update own record demo
  - cancan the activities 


  
**[TODO]**

- write the tests and get to 100% coverage
- use cancancan?
- change the erb files to haml
- notifications
  - paginate - never ending page?
  - ajaxify it
- i18n-tasks do localization, add instructions how to monitor i18n
  - change locale
    - http://stackoverflow.com/questions/6822440/change-locale-at-runtime-in-rails-3
    - make a locale controller that skips authentication, so user can change locale even when not logged in
    - checks user, then checks session. user has default locale setting
- add factory_girl to development environment:
  - http://stackoverflow.com/questions/16092861/factorygirl-creating-objects-in-development-environment
  - https://github.com/james2m/seedbank
- Add the other features
  - gem 'country_select'
- better show scaffold

## Other Steps

### Enabling the Postgres extensions

```
class EnableUuidOsspExtension < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    enable_extension "hstore"
  end
end
```

Then run `bundle exec rake db:migrate`.

### Change to UUID

From

```
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :status
```

To

```
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :status, default: 0
```

Notice the default `0` on `status`? It is a good practice to set the first declared status to be the default. See it tie-in to the following section.

### Provide the mapping for status

```
class User < ActiveRecord::Base
  enum status: { active: 0, archived: 1 } # explicitly declare the mapping, avoid headaches
  after_initialize {self.active! if self.status.ni?}
end
```

The after initialize call is useful to so that `User.new.active?` is `true`.

### Configuring the Devise User Model

It should look like below:

```
class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
    end

    add_index :users, :reset_password_token, unique: true
    add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
```

Update the model file to reflect the modules used:
```
class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :validatable, :lockable, :timeoutable
  enum status: { active: 0, archived: 1 } # explicitly declare the mapping, avoid headaches
  after_initialize {self.active! if self.status.ni?}
end
```

### ActionMailer settings

In an initializer, `action_mailer.rb`:
```
ActionMailer::Base.smtp_settings = {
  address:        Base::Settings.mailer.address,
  port:           Base::Settings.mailer.port,
  user_name:      Base::Settings.mailer.user_name,
  password:       Base::Settings.mailer.password,
  authentication: :plain,
  enable_starttls_auto: true
}

ActionMailer::Base.asset_host = Base::Settings.mailer.asset_host

ActionMailer::Base.delivery_method = Base::Settings.mailer.delivery_method || :smtp

ActionMailer::Base.default_url_options[:host] = Base::Settings.mailer.default_url_options.host
ActionMailer::Base.default_url_options[:port] = Base::Settings.mailer.default_url_options.port
```

In the settings, for development:
```
mailer:
  delivery_method: :smtp
  address: localhost
  port: 1025
  user_name: admin@baseapp.com
  password: dr0wss@p
  asset_host: http://localhost:3000/
  default_url_options:
    host: localhost
    port: 3000
```

### Create the users's dashboard

Add to config/routes.rb
```
Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'dashboard'
    end
  end

  root 'users#dashboard'
```

Create the dashboard action and view.


# How this application should be maintained

## Periodically check for vulnerabilities

    bundle-audit update
    bundle-audit

## Keep in step with the latest and greatest

You should watch developements on crticial gems. Aside from vulnerabilities, there may be bugfixes or enhancements that you
would need. You can do these steps per gem, or occassionaly you would like to update all in one fell swoop.

Note: you may do this mid-development, so you may not be working with the master branch.

### Checkout latest and create an upgrade branch

    git checkout master
    git pull
    git checkout -b upgrade_2014_07_01
    bundle update

### Keep the gems *Vulnerability Free*

    bundle-audit update
    bundle-audit

### Make sure all the tests pass

    bundle exec rspec

If there are failing tests, update them. If you need to peg certain gems to specific versions, do it. Make sure you comment on that
in your Gemfile.

### Commit the changes

