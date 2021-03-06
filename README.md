# Public Events Demo Project

This is one of the projects derived from [Michael Hartl](https://www.michaelhartl.com/)'s [Ruby and Rails Tutorial Book](https://www.railstutorial.org/book). In this project I am to create a site similar to "Eventbrite" which allows users to create events and then manage user Sign Up. Users can create events and send invitations and parties. Events take place at a specific date and at a location.

[Project Demo](https://public-events-278.herokuapp.com/)

## Note

- This is a study project for learning Ruby on Rails - Active Records concept.
- This project have 2 major model - User & Event, one bridge model - Attendance.
- User can create events (one to many), can attend many Events if possible, Event can have many attendees (one to many).

## To Run locally

- Clone repository to your local machine, and enter project root folder.

```shell
git clone repo_url
cd repo_dir
```

- Install necessary dependencies, create db(for development), generate seed data.

```shell
bundle install
rails db:create db:migrate db:seed
```

- Start the server, visit `http://localhost:3000` from your browser.

```
rails server
```

## Reference

- [Odin Project Requirement](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)

- [Conectp of Scopes in Rails](https://guides.rubyonrails.org/active_record_querying.html#scopes)

- [Active Records Basic](https://guides.rubyonrails.org/active_record_basics.html)
