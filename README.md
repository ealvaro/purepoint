Just recently, (09/2017), I was asked by a potential employer to create in a couple of hours a very simple, quick Ruby on Rails website demonstrating search functionality using a third-party API and latest bootstrap 4 look and feel. It actually took me a whole day to complete it because I recorded a Youtube video on how I did it. These are the project specs sent by the employer  and you can find the video at https://www.youtube.com/watch?v=oXgXSdTt4I0

# Technical Interview: Ruby Test #
A mini test using the RecipePuppy API 
 
### Project ###
 
A recipe finder app using the RecipePuppy API: ​ http://www.recipepuppy.com/about/api/  
 
### Requirements ###
 
- The user types in a search query for the name of a recipe and hits enter (submit)  
- Only the first 20 results of a search are displayed 
- Code should be written in Rails 5.0.3 & Ruby 2.4.0 
- Frontend should use Bootstrap 4 for styling 
 
### Assessment criteria ###
 
1. How well the requirements above are met 
2. Code quality 
3. The simplicity and extensibility of the approach taken 

#### P.D.####
Make sure you rename config/env.yml to local_env.yml  

### Initial Steps taken to start the project ###

```shell
rails new purepoint
cd purepoint
vim Gemfile #Add HTTParty
rails g scaffold recipe title href ingredients thumbnail
```