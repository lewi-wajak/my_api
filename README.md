# Welcome to my api
***

## Task
The goal of this project is to create a RESTful API for managing Volcano data. The main challenge is to make sure user authentication is secure and to provide strong data handling features while keeping data accurate and fast.

## Description
This API lets users securely access the Volcano database with Doorkeeper OAuth. Users can log in, create accounts, and manage Volcanic records. It's designed for Postman testing and offers a GraphQL interface for easy browser use.
* Challenges:  I have commentted the first line of code (before_action :doorkeeper_authorize!) in the volcano_controller.rb file because I am using a Free Tier instance on the render.com. So, I don't have access to the render shell to get client_id and client_secret for user to have access_token. But with the line commented user can fetch, create, update and delete volcanic record.

## Tech Stack
* Ruby          
* PostgreSQL
* Redis
* Node v22.13.1
* Yarn 1.22.22
* ruby 3.3.7
* rails 8.0.1

## Project Installation
- follow the procedures below
* clone the repository locally to your machine
* navigate to the project directory
* bundle install
* setup database with:
    - rails db:create
    - rails db:migarte
    - rails db:seed
* start the server with rails server or rails s


## Usage
 * Postman Documentation
    1. Authenticate User/Admin to get the access token
        Endpoint: POST [/api/v1/oauth/token](http://localhost:3000/oauth/token)
        * Parameters:
            - grant_type: password
            - email: User's email
            - password: User's password
            - client_id: Client's id
            - client_secret: Client's secret
    * Example of Request
            {
        "grant_type": "password",
        "client_id": "client id",
        "client_secret": "client",
        "email": "lewiwajak@gmail.com",
        "password": "883256"
        }

    * Example of Respond
        {
        "access_token": "The access token",
        "token_type": "Bearer",
        "expires_in": 7200,
        "refresh_token": "The refresh token",
        "created_at": 35467648756
        } 

 2. To get client id and client secret, follow the steps below
    * rails c
    * Retrieve clients details  
        app = Doorkeeper::Application.last

        app.uid #This is the client ID

        app.secret #This is the client secret           

3. Create User (None Admin User)
    * Endpoint: POST [/api/v1/users](http://localhost:3000/users)
        - Parameters: Provide necessary user details in the request body.
        - email: User's email
        - password: User's password
        - client_id: Application's id
        - Description: This endpoint allows for the creation of a new user account.

        * example of request
            {
            "user": {
                "email": "lewiwajak@gmail.com",
                "password": "883256",
                "password_confirmation": "883256"
                 }
            }

        * example of response
            id": 3,
            "email": "lewiwajak@gmail.com",
            "access_token": "0o11KQ49nxvYDkjngyJP55uTvOlscS6rv2rtnzQ",
            "token_type": "Bearer",
            "expires_in": 7200,
            "refresh_token": "0638397c9831f26f6e29de920f17ebba311b75e4a41777ef5b753328bec",
            "created_at": 5644209879    


4. Access Volcanic Data
    * Endpoint: GET [/api/v1/earthquakes](http://localhost:3000/volcanos)
    *  Description: Fetch a list of earthquake records with pagination (max 20 elements per page). 
        Get is not a Protected route, you can fetch data without authorization.

5. Set Up Authorization in Postman
    Open Postman and select the request you want to authorize (create, update, or delete).
    Click on the Authorization tab.
    Under Type, select Bearer Token.
    Paste the access token you received from the login request into the Token field.

6. Create a New volcano record
    * Endpoint: Post http://localhost:3000/volcanos/ 
    * Headers
        {
    "Content-Type": "application/json",
    "Authorization": "Bearer JsXI8V8bN8kOkZXYoBJvRSUXCFKzEuuUV2_RGHJ0Tao"
    }  

    * Request
                {
        "volcano_name": "Mount Kumo",
        "country": "Nigeria",
        "latitude": 10.2954,
        "longitude": 11.1687,
        "elevation": 2500,
        "primary_volcano_type": "Stratovolcano",
        "activity_evidence": "Dormant",
        "last_known_eruption": "1850-06-12",
        "year": 1850,
        "month": 6,
        "day": 12,
        "tsu": "No",
        "eq": "No",
        "vei": 3,
        "deaths": 0,
        "damage_mil": 0.0,
        "houses_destroyed": 0,
        "total_deaths": 0,
        "total_damage_mil": 0.0
        }


        you'd recieve a 201 created response



7. Update an Existing Earthquake Record

Endpoint: Put http://localhost:3000/volcanos/id
Replace :id with the ID of the volcano record you want to update.
* Headers
        {
    "Content-Type": "application/json",
    "Authorization": "Bearer JsXI8V8bN8kOkZXYoBJvRSUXCFKzEuuUV2_RGHJ0Tao"
    }  

 * Request Body
    {
    "volcano_name": "Updated Mount Kumo",
    "elevation": 2700
    }

You should receive a 200 OK response if the update was successful, along with the updated volcano record.

8. Delete a volcano Record

Endpoint: Delete http://localhost:3000/volcanos/id
Replace :id with the ID of the volcano record you want to delete.
* Header
"Authorization": "Bearer JsXI8V8bN8kOkZXYoBJvRSUXCFKzEuuUV2_RGHJ0Tao"

 You should receive a 204 No Content response if the deletion was successful.

## Accessing the Hosted version (Postman)
You can access the hosted version of my project on
https://my-api-hu6y.onrender.com/

## GraphQL Interface
1. Accessing the GraphQL Interface
To use the GraphQL interface, open your web browser and go to http://localhost:3000/graphiql.

## NOTE: I couldn't implement the Doorkeeper Oauth to work with the GraphQL Interface but you can locally perform the following queries and mutations on your browser or postman.

2. Query Vocanos
Example of query
{
  "query": "query { volcanoes(primaryVolcanoType: \"Stratovolcano\") { id volcanoName country primaryVolcanoType } }"
}

- Description: This query retrieves a list of all volcanos of type strato volcano from the database with pagination (max 20 elements per page).
 example of query
 {
  "query": "query { volcano(id: 1) { id volcanoName country elevation } }"
}

- Description: This query retrieves a particular volcanos specific data

3. Create a volcano
    * Example of Mutation
        {
    "query": "mutation { createVolcano(input: { volcanoName: \"Mount Test\", country: \"Testland\", latitude: 10.5, longitude: 20.3, elevation: 2500, primaryVolcanoType: \"Stratovolcano\", activityEvidence: \"Active\", lastKnownEruption: \"2020\", year: 2020, month: 6, day: 15 }) { volcano { id volcanoName country elevation } errors } }"
    }

    * Example of response
        {
        "data": {
            "createVolcano": {
                "volcano": {
                    "id": "2224",
                    "volcanoName": "Mount Test",
                    "country": "Testland",
                    "elevation": 2500
                },
                "errors": []
            }
        }
    }

4. Update a Volcano
    * Example of mutation
        {
    "query": "mutation { updateVolcano(input: { id: 2224, elevation: 3000, activityEvidence: \"Dormant\" }) { volcano { id volcanoName elevation activityEvidence } errors } }"
    }

    * Example of response
    {
    "data": {
        "updateVolcano": {
            "volcano": {
                "id": "2224",
                "volcanoName": "Mount Test",
                "elevation": 3000,
                "activityEvidence": "Dormant"
            },
            "errors": []
        }
    }
}

* Kindly Note that all the fields should be there but do not change the id 

5. delete a volcano
    * Example of mutation
            {
    "query": "mutation { deleteVolcano(input: { id: 2224 }) { volcano { id volcanoName } errors } }"
    }

## Postman Documentation Link
The follow the following link to access the postman documentation
https://documenter.getpostman.com/view/42522064/2sAYdcrXVJ


The Core Team
Lewi Wajak Abbai





