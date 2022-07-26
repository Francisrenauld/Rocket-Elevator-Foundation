# Context WEEK 8

For this week's project, we had to create 2 APIs along with a new table for our postgreSQL database and fake data for the new table. Our first API was made using graphql on Rails and our second API is a REST API with C#. The goal of this week's project was to allow us to get to know a lot more about APIs and how they work. We used ruby on rails, c# for our programing languages along with heroku to host our APIs online and postman to do GET,PUT,POST requests to test our REST API and publish our work for both APIs.

Link to our Website => https://rocketelevators.cfd/

Link to our Video => https://youtu.be/tKcguiwSwcM

# Tasks to quickly run specific actions :

| Command | Task Description |
| --- | --- |
| rails database:mysql | Run the following tasks: empty_mysql, fake|
| rails database:empty_mysql | Empty all mysql tables |
| rails database:fake | Populate mysql tables with fake data |
| rails database:run| Run the following tasks: Drop_Tables, create_psql_tables, populate_psql_tables|
| rails database:Drop_Tables | Drop all the tables in postgresql that are specified in the task |
| rails database:create_psql_tables | Create all the tables in postgresql that are specified in the task |
| rails database:populate_psql_tables | Populate all the tables in postgresql that are specified in the task with data from the mysql database|
| rails database:test_connection | Test your connection with the postgresql database and see what database you're connected to|

# The following example shows a query using graphql :
```
query interventions_by_building {
  building(id: 2) {
    id
    customer {
      id
      companyName
      cpyContactName: fullNameOfTheCompanyContact
      cpyContactEmail: emailOfTheCompanyContact
      cpyContactPhone: companyContactPhone
      cpyDescription: companyDescription
      createdAt
      updatedAt
    }
    interventions {
      id
      employeeid
      buildingid
      batteryid
      columnid
      elevatorid
      result
      report
      status
      start_of_the_intervention: startDateAndTimeOfTheIntervention
      end_of_the_intervention: dateAndTimeOfTheEndOfTheIntervention
    }
  }
}

```
## You should get something like this :

<img width="463" alt="image" src="https://user-images.githubusercontent.com/105597570/180460284-f8d86aee-c0c4-4cb0-9cf6-737f096b5e66.png">

# JSON link for our collection of requests for Postman
```
https://www.getpostman.com/collections/69bb0a21411e5a31393b
```
# Dependencies

  To test our project, you will need the following :

-   Postman => https://www.postman.com/downloads/
