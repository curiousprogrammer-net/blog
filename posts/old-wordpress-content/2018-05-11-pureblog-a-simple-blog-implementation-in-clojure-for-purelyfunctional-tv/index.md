---
title: "PureBlog: A Simple Blog Implementation in Clojure for PurelyFunctional.tv"
date: "2018-05-11"
---

_Discussing the first draft of my new hobby app PureBlog implemented for the purpose of getting some practice and feedback from Eric Normand (PurelyFunctional.tv)_. _It also was my first attempt to use Duct/Integrant micro-frameworks for building a real Clojure app._

## Introduction

I'm a subscriber of [PurelyFunctional.tv](http://purelyfunctional.tv/) and I think it's the best online resource for learning Clojure that is available out there. As part of the membership, Eric Normand (the man behind PurelyFunctional.tv) offers a free 30-min coaching session where you can discuss your Clojure learning strategy - issues, challenges, approaches, etc.

A while ago, during my coaching call, I mentioned that feedback from a real Clojure expert is one of the most important things for learning and that I'd lacked this type of feedback during my Clojure learning journey. To my surprise, Eric immediately offered his help in reviewing my code. What a great opportunity!

So we agreed upon creating a simple side-project - blog implementation in Clojure (Eric has a nice list of [10 Weekend projects to spruce up your functional resume](https://purelyfunctional.tv/functional-programming-career-guide/10-side-projects-resume/) on his website).

 

## PureBlog Application

I decided to make it a bit harder and take this as an opportunity to learn a bit about [Duct](https://github.com/duct-framework/duct) and [Integrant](https://github.com/weavejester/integrant) and use them in a real application (instead of a usual _ring + compojure_ combo). Although it took significantly longer than it could, it was fun and I've learned quite a bit about Duct and Integrant.

 

## Code Review Summary

Eric published his code review as [Blog in Clojure Code Review](https://www.youtube.com/watch?v=yQ-KjVNCe3g) youtube video.

Following is my summary of Eric's review, but please, watch the full video to make your own conclusion.

- I definitely agree with the idea of moving the translation logic ("readable" functions) to the _db_ namespace.
- **The namespaced maps**: Now I really think that they are an unnecessary clutter for such a simple CRUD app. Initially, I was inspired by [Fogus modeling a domain with namespaced maps](http://blog.fogus.me/2017/02/10/clojure-spec-data-design-01-sketching-a-struct/) and some other people suggesting them. I guess they could be more useful in a richer domain model. I'm curious to hear if you ever use them and what other factors you take into account when making that decision.
- **Separating protocol definitions** and getting rid of some functions (_update-post_ et al.) in features namespace is an interesting idea:
    - I agree that protocol definitions should be separated from the db implementation
    - As regards to the removal of functions in features/posts.clj I think they still might have some value - perhaps, not right now.
        - I was inspired by [Paul Stadig's Clojure Polymorphism](https://leanpub.com/clojurepolymorphism/) book where he frequently uses client namespace for protocol functions - maybe the benefits of doing so are not so obvious in my case but I'll probably leave them there. The protocol itself could be moved to completely separate namespace (Paul uses "protocol.clj" for this purpose). Perhaps the protocol should be kept in **_boundary/db.clj_**, but the implementations moved to **_boundary/sql.clj_** or something similar. I admit that it may well be a bit of overengineering for the sake of this app, though.
        - I think that at least the \`preview\` function should probably be kept in "features" namespace as opposed to the db namespace.
- **Using _select-keys_ instead of _dissoc_ in _update-post_** **function** is _probably_ good advice. I couldn't make up my mind which approach is better because I was worried that I'd have to change the _update-post_ implementation every time I decide to add a new field to the post. I expect that (generally speaking) I'll want to make new fields updatable and (hopefully) only the _user\_id_ and _created\_date_ will remain the ones that should not be updated (that is they are used only in _create-post_ function). I guess there's a bit of conflict because I try to reuse _readable->db-post_ function for both _update-post_ and _create-post_ but there's a small difference between them. Maybe  I could just duplicate the logic and move on.
- calling _now()_ twice & **using** **_remove_ instead of _(filter (complement ...)_** - nice catch!

## Conclusion

You can find the source code in [pure-blog GitHub repo](https://github.com/jumarko/pure-blog). The version that Eric reviewed is tagged as [_**mvp-1.0**_](https://github.com/jumarko/pure-blog/tree/mvp-1.0)_._ A read-only version of the PureBlog application is available at [http://pureblog.curiousprogrammer.net:3000/](http://pureblog.curiousprogrammer.net:3000/).

I'm happy to hear your comments and additional feedback! Feel free to comment on the [Github issue _**Initial Feedback**_](https://github.com/jumarko/pure-blog/issues/1).

### Future

I haven't had time to move this project beyond the initial version but I do plan to do more work, implement Eric's suggestions and add more features. However, this app isn't intended to be really practical/useful; just "whimsical" :).

Some more features/things I'd like to do in the future:

- Authentication and login
    - It might include a proper user-registration process as well
- Markdown editor
- Datomic as a persistence layer
    - May be used for features like _Post edits history_
- Tags & Comments
