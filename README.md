# Standard File Server, Ruby Implementation

This is a production-ready reference implementation of the [Standard File](https://standardfile.org/) protocol.

A production client is available at https://app.standardnotes.org

### Running your own server
You can run your own Standard File server, and use it with any SF compatible client (like Standard Notes). This allows you to have 100% control of your data. This server implementation is built with Ruby on Rails and can be deployed in minutes.

#### Getting started

**Requirements**

- Ruby 2.2+
- Rails 5
- MySQL database

**Instructions**

1. Clone the project:

	```
	git clone https://github.com/standardfile/ruby-server.git
	```

2. Create a .env file in the project's root directory. Add environment variables (see Environment variables for full listing):

	```
	DB_HOST=localhost
	...
	```

3. Initialize project:

	```
	bundle install
	rails db:create db:migrate
	```

4. Start the server:

	```
	rails s
	```

### Deploying to a live server

You can find instructions on deploying an SN server from scratch here:

[Deploying a Standard File server with Amazon EC2 and Nginx](https://github.com/standardfile/ruby-server/wiki/Deploying-a-private-Standard-File-server-with-Amazon-EC2-and-Nginx)

### Environment variables

**DB_HOST**

Database host.

**DB_PORT**

Database port. 3306 is standard.

**DB_DATABASE**

Database name.

**DB_USERNAME**

Database username.

**DB_PASSWORD**

Database password.

#### Optional environment variables if you want to use Dropbox

**HOST**

Server url

**DROPBOX_CLIENT_ID**

Dropbox client id

**DROPBOX_CLIENT_SECRET**

Dropbox client secret

### Running tests

Ruby Standard File Server uses [rspec-rails](https://github.com/rspec/rspec-rails)
with [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) for testing.
In order to run the tests, please run the follow commands.

When you are running the tests for the first time, run:

  ```
  rails db:test:prepare
  ```

After that, run the following command to actually start rspec test suite:

  ```
  bundle exec rspec
  ```

## Contributing
Contributions are encouraged and welcome. Currently outstanding items:

- Test suite

## License

Licensed under the GPLv3: http://www.gnu.org/licenses/gpl-3.0.html
