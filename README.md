# README

### How would you handle profanity filtering?

When the post request was made, I would run the comment_body through another class (called ProfanityChecker) that checked for profanity in some text. If it found some, those words could be removed and then the comment could be stored in the database minus the bad words (though that might just make for an awkward comment to read). Alternatively, you could reject the comment altogether if you found profanity and let the user know that they need to watch their language!

### How would you handle security and authentication?

I'm not sure if this is the best way to do this, but in my api controller, I setup an api token and each call would be authenticated according to that token. This should add some level of security as not everyone will be able to read, write or update.  I commented it out for now but added it to illustrate what I thought could work.  

### How would you handle functionality where all comments went through an admin approval phase before going live?

I would add an `approved` field to the comment table and default it to false. In whatever view renders the comments, we would only display those fields that were true. 