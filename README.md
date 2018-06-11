#Readme

This is a very basic query engine application to execute real time queries on the user data.
The app uses Ruby 2.4.1 and Rails 5.2.0

The search mechanism is achieved using Ruby SunSpot interaction with Solr search engine.
Execute the below code to ensure the Solr is up and running
  1. rails sunspot:solr:start


To get this application running follow the below steps:

  1. Execute rails server
  2. Open the browser and type 'http://localhost:3000/'
