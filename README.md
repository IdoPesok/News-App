# News-App
A news app built with swift and a news API (newsapi.org)

# Getting Started
To run the app on your computer clone the repo and change directories into the project folder. Then run "pod install" to install the dependencies needed to run the app. Open XCODE and click RUN :)

# How It Works
The code uses swift's decodable protocol to take the JSON retrieved from the API and convert it to an Article object.
<br/>
<br/>
The main controller (home) is a UITableViewController and it's cells are of type ArticleCell. Each cell has a dynamic height and contains all the information about the article.
