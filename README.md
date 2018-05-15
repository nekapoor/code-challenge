# README

### How would you handle profanity filtering?

When a post request is made to create a comment, I would first run the `comment_body` through another class (maybe called `ProfanityChecker`) that checked for profanity in some text. 

If bad words were found, those words could be removed from the string and then the comment could be stored in the database (though that might just make for an awkward comment to read). Alternatively, you could reject the comment altogether if you found profanity and let the user know that they need to watch their language!

### How would you handle security and authentication?

I'm not sure if this is the best way to do this, but in my api controller, I have a commented out before_action filter that checks a token parameter. Each call would be authenticated according to that token and presumably, somehow the users utilizing this api would know that token. This should add some level of security as not everyone will be able to read, write or update. There should be options to refresh the token and to send a timestamp of when the current token the end user has will expire. 

### How would you handle functionality where all comments went through an admin approval phase before going live?

I would add an `approved` field to the comment table and default it to false. In whatever view renders the comments, we would only display those fields that were true. 


#### General Notes

1. I didn't include the `group_id` in the Doctor table because it wasn't going to be of use to me in my solution. It was an intentional item left out. 
2. I didn't get to write tests for my Recommendation class because I was pushing up against the time limit set. 
3. I did leave some comments in the recommendation class for what I implemented and what a more well-developed recommendation class might involve. 
4. You'll notice that I have a `DoctorRecommendation` class and a `BasicRecommendation` class that is passed as a default source to `DoctorRecommendation`. This way, if another better recommendation engine was built and it responded to the method `recommendations`, it could be easily swapped in for the `BasicRecommendation`  class I built. 

