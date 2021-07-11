# README


```
bundle

rake db:create db:migrate

rails s
```

or to start a console:

```
rails c
```

# Recipe App/Api

### SaaS Wiki Collaboration Tool

Users can create, edit and on recipes.

[Demo Site](https://foodielarry-api.herokuapp.com/)
Test User: test@gmail.com
Password: 'password'

## Project Objectives

- Users can sign up for a free account by providing a user name, password and email
- Users can sign in and out of app
- Users can retrieve random recipes from Spoonacular API
- Users can create new recipes and save them into database
- Users can search for recipe
- Users can make graphql calls to app
- Development database is seeded automatically with users and recipes


## Built With

#### Languages and Frameworks:
- Ruby 2.6.3
- Rails 6.0.3.6
- Tailwind
- Graphql

#### Databases:
- PostgreSQL

#### Tools and Gems:
- Devise for user authentication
- Faker for seeding fake data
- Graphql for api
- PG Search for search features

## Setup and Configuration

#### To run Recipe app What locally:

1. Clone the repository
2. Run `bundle install`
3. Create and migrate the database with `rake db:create` and `rake db:migrate`
4. Start the server using `rails server`
5. Run the app on `localhost:3000`

#### In progress:
- Allow users to create meal plans
- Testing with Rspec
- Data scrape other recipe site for recipes
