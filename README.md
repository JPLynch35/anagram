# Anagram

Anagram is a back end API, made to store words and track anagrams.  Words can be added or deleted from the data store, and then queried against in order to find anagrams for a specified input.  

## Production Site  
[https://anagramfinder35.herokuapp.com](https://anagramfinder35.herokuapp.com)  
*Partial word database due to Heroku limit (~5k).

## Project Management 
[https://trello.com/b/JgkPHYfK/anagram](https://trello.com/b/JgkPHYfK/anagram)

## API Endpoints
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

  * **Code:** 201 <br />
  * **Content:** None
 
* **Sample Call:**

  ```
  $ curl -i -X POST -d '{ "words": ["field", "table", "cup"] }' http://localhost:3000/words.json
  ```
### Find Anagrams  

  Returns a JSON array of English-language words that are anagrams of the word passed in the URL.

* **URL**

  /anagrams/<b>:word</b>.json

* **Method:**

  `GET`
  
*  **URL Params**

	**Required:** Replace <b>:word</b> with your desired word.  
	**Optional:** `limit=[integer]` Set to limit number of return anagrams.  

* **Data Params**

   None

* **Success Response:**

  * **Code:** 200 <br />
  * **Content:**  `{"anagrams": ["wordone", "wordtwo"]}`
 
* **Sample Call:**

  ```
  $ curl -i http://localhost:3000/anagrams/read.json?limit=2
  ```
### Delete a Word  

  Deletes a single word from the data store.

* **URL**

	/words/<b>:word</b>.json

* **Method:**

  `DELETE`
  
*  **URL Params**

	**Required:** Replace <b>:word</b> with your desired word.

* **Data Params**

	None

* **Success Response:**

  * **Code:** 204 <br />
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

  * **Code:** 204 <br />
  * **Content:**  No Content
 
* **Sample Call:**

  ```
  $ curl -i -X DELETE http://localhost:3000/words.json
  ```

## Getting Started Locally

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
Create the database and prep the migrations.
```
rake db:{create,migrate}
``` 
Now load the word list from the provided text file.  This will take some time, but a progress bar has been added to monitor progress.
```
rake import:txt
``` 

### Running Tests

This application has two separate test suits.  One is ran internally within the project, utilizing RSpec.  The second is ran externally on a running localhost:3000.

##### Internal
In order to run the internal test suite, call upon RSpec in the terminal while in the application folder.  
```
rspec
```

##### External
In order to run the external test suite, you must first run the server for this application locally.
```
rails s
```
Open the test application, <b>platform_dev</b>, and remove all the pending lines from tests.  From within the platform_dev application folder, run the test file.
```
ruby anagram_test.rb
```

## Importing Words from Supplied List

<b>Important:</b> The external test suite will fail if the words are imported into the development database as the test is ran against development on localhost:3000.

Inside the project directory, run the following rake command. The imported list is rather large and will take some time to complete.  A progress bar has been added, allowing you to monitor progress.
```
rake import:txt
```

## Authors

* **JP Lynch**
