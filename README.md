# Quick Starter | Rails 6.0.1 & Ruby 2.6.5

Hi fellows this project has the intuit to share solutions for the most common needs in fresh projects. It will boost your start and create a fully configured project along with great tools to keep your quality up. The project has one module named User which is used to authenticate.

## Summary
- API Only.
- Authentication through JSON Web Token | [Knock](https://github.com/nsarno/knock)
- Authorization (ACL) pre-configured and ready to go | [Pundit](https://github.com/varvet/pundit)
- Virtualized with Docker and Docker-compose in separated containers for database (Postgres) and application.
- All JSON responses serialized and ready to go |  [Netflix Fast Json API](https://github.com/Netflix/fast_jsonapi)
- Along with serialization, there's the metadata object to work with server-side pagination, boosting your application performance | [Pagy](https://github.com/ddnexus/pagy)
- Soft deletion configured for sensitive entities | [Soft Deletion](https://github.com/grosser/soft_deletion)
- User model configured to save password with OpenBSD bcrypt() hashing algorithm | [bcrypt](https://github.com/codahale/bcrypt-ruby)
- CORS configured to accept requests from any domain. **BE CAREFUL**: change it before production release.
- All response strings centralized on i18n files. By default, application is using EN-US but you can change it by creating yml files for you idiom. For more click [here](https://guides.rubyonrails.org/i18n.html).
- API documented with Postman on documentation/ folder.
- VSCode configuration to run Rubocop lint on code while you develop to save your time. You'll need [docker-linter](https://marketplace.visualstudio.com/items?itemName=henriiik.docker-linter) and [ruby-rubocop](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop) extensions to properly work.
- Ruby style guide with Rubocop using [Shopify](https://shopify.github.io/ruby-style-guide/rubocop.yml) rules.
- Automated test suite: Rspec, Factory bot, shoulda-matchers, faker, simplecov and database_cleaner. There're examples of Request *[Why to use Request specs instead of obsolete Controllers spec](http://rspec.info/blog/2016/07/rspec-3-5-has-been-released/)* and Models tests along with Factories for User, Rspec shared examples, helpers to sanitize JSON responses and to create authentication valid headers.

## Prerequisites
- [Docker](https://docs.docker.com/install/)
- [Docker-compose](https://docs.docker.com/compose/install/)

## Installation
- Clone the repository and navigate to the folder.
- Run `$ docker-compose up --build`, docker will download the images and create the containers, it might take a while. Before finish, it will run start.sh file which will configure database (Create, migrate and seeds).
- If you have Rails binary locally open another instance of terminal and run `$ rails credentials:edit`.
- If you don't you can execute `$ docker exec -it quick_starter_api bash` and generate the master.key with `# rails credentials:edit` from inside the container. It will create the config/master.key which is required to work with JWT auth.
- The server will be up on 3000 port, you can access now by `localhost:3000` 

## Getting Started
- Run application with `$ docker-compose up`
(*After the first *docker-compose up --build* it's not necessary to run again with **--build**)
- Login with User from seed by sending a POST to `localhost:3000/api/v1/login` with JSON body: 
``` JSON
{
  "auth": {
    "email": "marcos@marcos.com",
    "password": "123"
  }
}
```
it will return an object with JWT token. Take it and use on header `Authentication: Bearer TOKEN_JWT` in other requests, like `GET localhost:3000/api/v1/users`
- For futher information about API documentation you can import to [Postman](https://www.getpostman.com/downloads/) the collections from documentation/api_postman_collections 
- Your application is ready to go!

## Running the tests
Inside the project folder execute `$ docker exec -it quick_starter_api bash` and then run `# rspec` after running all tests it will generate a coverage/ folder with the report in HTML format.

## Running static code analyzer
Inside the project folder execute `$ docker exec -it quick_starter_api bash` and then run `# rubocop`

## Contributing
Please check this repo's CONTRIBUTING.md file for guidelines on how to contribute. Your pull request is welcome!

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
