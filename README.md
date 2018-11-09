# Anagram  
---

Anagram is a Rails-based back end API, made to store words and track anagrams.  Words can be added or deleted from the data store, and then queried against in order to find anagrams for a specified input.  The application utilizes a PostgreSQL database with a Redis memory cache for faster queries, and also utilizes a daily scheduled task on the production site in order to remove childless entries, scheduled for 2 AM (MDT/MST).  ScoutApp was used for production benchmarking.

## Production Site  
---
[https://anagramfinder35.herokuapp.com](https://anagramfinder35.herokuapp.com)  
*Partial word database due to Heroku limit (~5k unique words).

## Project Management 
---
[https://trello.com/b/JgkPHYfK/anagram](https://trello.com/b/JgkPHYfK/anagram)

## API Endpoints
---
### Add Words  

  Takes a JSON array of English-language words and adds them to the data store.

* **URL**

    /words.json

* **Method:**

    `POST`
  
*  **URL Params**

	  None

* **Data Params**

    **Required:** `{"words": ["wordone", "wordtwo", "wordthree"] }`

* **Success Response:**

  * **Code:** 201  
  * **Content:** None
 
* **Sample Call:**

    ```
    $ curl -i -X POST -d '{ "words": ["field", "table", "cup"] }' http://localhost:3000/words.json
    ```
### Find Anagrams  

  Returns a JSON array of English-language words that are anagrams of the word passed in the URL.

* **URL**

    /anagrams/**:word**.json

* **Method:**

    `GET`
  
*  **URL Params**

	  **Required:** Replace **:word** with your desired word.  
	  **Optional:** `limit=[integer]` Set to limit number of return anagrams.  

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200  
  * **Content:**  `{"anagrams": ["wordone", "wordtwo"]}`
 
* **Sample Call:**

    ```
    $ curl -i http://localhost:3000/anagrams/read.json?limit=2
    ```
### Delete a Word  

  Deletes a single word from the data store.

* **URL**

	/words/**:word**.json

* **Method:**

    `DELETE`
  
*  **URL Params**

	  **Required:** Replace **:word** with your desired word.

* **Data Params**

	  None

* **Success Response:**

  * **Code:** 204  
  * **Content:**  No Content
 
* **Sample Call:**

    ```
    $ curl -i -X DELETE http://localhost:3000/words/read.json
    ```
### Delete All Data  

  Deletes all contents of the data store.

* **URL**

	/words.json

* **Method:**

    `DELETE`
  
*  **URL Params**

	  None

* **Data Params**

	  None

* **Success Response:**

  * **Code:** 204  
  * **Content:**  No Content
 
* **Sample Call:**

    ```
    $ curl -i -X DELETE http://localhost:3000/words.json
    ```

## Getting Started Locally  
---

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.  

### Prerequisites  

This application was created in Rails v5.1.6, utilizing Ruby v2.4.1. 

### Installing  

Clone the project down locally to your machine.  
```
git clone https://jplynch35@bitbucket.org/jplynch35/anagram.git
```  
Inside the project directory, prepare the gems for development with bundler.  
```
bundle install
``` 
Create the database and run the migrations.
```
rake db:{create,migrate}
``` 

## Importing Words from Supplied List  
---

Inside the project directory, run the following rake command. The list is rather large and will take some time to complete importing.  A progress bar has been added, allowing you to monitor progress.
```
rake import:txt
```

## Running a Local Server 
---

Inside the project directory, start a local application server.
```
rails s
``` 
In a seperate terminal console within the project directory, start a local Redis server.
```
redis-server
``` 

### Running Tests  
---

This application has two separate test suits.  One is ran internally within the project, utilizing RSpec.  The second is ran externally on a running localhost:3000.

##### Internal
In order to run the internal test suite, call upon RSpec in the terminal while in the application folder.  
```
rspec
```

##### External
In order to run the external test suite, you must first run the server for this application locally (refer above to Running a Local Server).

Open the test application, **platform_dev**, and remove all the pending lines from tests.  From within the platform_dev application folder, run the test file.
```
ruby anagram_test.rb
```

## Authors  
---

* [JP Lynch](https://github.com/JPLynch35)
