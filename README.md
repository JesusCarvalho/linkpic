LinkPic
=========





Rest-based microservice to screenshot a given URL and insert the resulting PNG as a blob into an RDBMS.

This MSA is designed to be deployed with a CRUD I am writing for a local enforcement incident response system.  

It will serve to capture screenshots of urls containining information pertinent to the incident being recorded 

(ex: incriminating tweets, tumblr, vines, etc).  

Capturing this data isn't worth having the app block over so it makes sense to split off as a REST-based service

There are no tests...that's what Production is for.

Obviously, this should rate-limited via the web server.

Version
----

1.0.0 (Semantic, unless you're not into that)

Tech
-----------

LinkPic uses a number of protocols/open source projects to work properly:

* [Ruby] - Matz is nice, so we are nice
* [Ruby on Rails] - I once saw DHH do yoga on an airport treadmill 
* [HTTP] - would someone hurry up and shoot this old horse already
* [rodent] - REST made relaxing
* [Selenium-WebDriver] - screenshot via headless webkit



Installation + Initilization
--------------

```sh
git clone [git-repo-url] linkpic
cd linkpic
bundle
rails s
```

##### Configure Plugins. Instructions in following README.md files

* Assumes Ruby >= v2.xx and Rails >= 4.xx
* Assumes bundler gem installed
* Assumes a db located on port 5400 named rule2d,
* Assumes a table called rule2user.url which can accept blob data in a column called screenshot
* Tweak the config/database.yml if the above 2 are not to your liking, again this is specific to another product called R2

Usage
-----
Of the 4 HTTP verbs that can cause a neckbeard heartburn, I have chosen the least hearburny as my steed: ```PUT```.  

LinkPic will error for anything else, valid hash below:
```sh
$.ajax({
    type: 'PUT',
    url: 'http://localhost:3000/url/screenshot',
    data: { header_id: 1234,
            link: 'www.google.com',
            description: 'The criminal used this to access information way above their IQ'}
});
```


License
----

Copyleft



