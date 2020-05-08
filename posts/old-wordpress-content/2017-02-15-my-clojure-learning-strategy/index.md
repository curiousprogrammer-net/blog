---
title: "My (Clojure) learning strategy"
date: "2017-02-15"
---

_In this post, I’ll discuss the general learning strategy and show an example how to apply it to Learning the Clojure programming language._

_I was heavily inspired by [10-step learning process from John Sonmez](https://simpleprogrammer.com/products/learn-anything/) which I first encountered in his book_ [Soft Skills: The software developer’s life manual](http://amzn.to/2kJdgZ4) and _the process outlined in the book_ _[Novice to Expert: 6 Steps to Learn Anything, Increase Your Knowledge, and Master New Skills](http://amzn.to/2kwEWPM) by Steve Scott._

## **The past**

I used to approach learning new things without a strategy.

When I found a cool piece of technology that I’d like to know more about, I  spent a weekend by reading about it. I might have tried to play with some code a little, but mostly only by copying exercises from the tutorial into console/editor. Once the weekend was over, I just ran out of time or got distracted by some other cool technology and never got to the former one again. I might even have forgotten that I read about that thing at all.

I burnt thousands of hours without actually learning too much. I thought that I could rush through the tons of information and actually learn it.

It doesn’t work that way - not for me.

## A better approach

If you really want to learn something you need consistency. You have to accept that it will be boring. You must prepare yourself for the hard work - there are no shortcuts.

Having that said, what are my tips for learning Clojure or any other topic?

### **Focus on a single learning project at a time**

- Learning new complex topic is already hard, and you’ll make it a lot harder if you try to learn many different things at once.
- Especially, if you have a full-time job try to focus on a single topic. This approach will increase your chance to finish it in a foreseeable future.
- Trying to learn many new things at once will probably result in frustration, and you will end up failing at all of them.

### **Create learning plan**

- To succeed you need to start with a clear **[S.M.A.R.T](http://topachievement.com/smart.html)** (Specific. Measurable. Achievable. Relevant. Time-boxed.) **end goal** in your mind.
    - An example of a bad goal: “I want to learn Clojure and ClojureScript”
    - An example of a better goal: “I’ll learn enough of Clojure, ClojureScript and web development libraries so that I can build the first version of a non-trivial Clojure web application with REST API and simple UI within three months”
        - Here I’m playing with an idea to create _My Bookshelf_ application for simple book management (I love books).
- Another key point to realize is that you don’t need to achieve mastery in everything you want to learn. Try to always identify the desired level from 1-10 (1 - very basic overview; 10 - mastery).
- More details later in section _10-step learning process_

### **Execute the plan on a daily basis**

- A consistent, deliberate practice is essential for success
    - _Ideas are easy, Implementation is hard_ (Guy Kawasaki: [http://www.forbes.com/2004/11/04/cx\_gk\_1104artofthestart.html](http://www.forbes.com/2004/11/04/cx_gk_1104artofthestart.html))
- Reserve at least 0.5 h each day for mastering new skill
    - The minimal duration can vary, but I’d rather recommend spending at least 1 hour working on your project each day
- Work on each step in iterations until you finish all steps - one step at a time
- **Two tasks daily rule**
    - one repeating task
        - You can practice Clojure programming skills via [Exercism.io](http://exercism.io/), [4Clojure](http://www.4clojure.com/problems), or [Clojure Koans](http://clojurekoans.com/).
        - You can also decide to spend time by reading a relevant book and trying out the examples
    - one task from a project list
        - Pick one task from your project and try to complete it.
        - For example: “Create a project structure for My Bookshelf application. Create git repository and push the skeleton.”
- Focus on practical experience rather than just cramming a huge amount of information from books and the internet into (and out of) your head
    - Create a learning project to practice everything you want to learn

## **Example of _10-step learning process_**

What follows, is my implementation of _10-step learning process_ outlined in [Soft Skills: The software developer’s life manual](http://amzn.to/2kJdgZ4) by John Sonmez.

The example demonstrated here is for _My Bookshelf_ Clojure web application:

### **Step 1: Get the big Picture - 50,000 ft view**

- I’ve already written some Clojure/ClojureScript code in the past and read lots of articles and [Living Clojure](http://amzn.to/2kJbsiC) book.
- Following are my observations:
    - I know what I want to do: _Create a web application for book management._
    - I know what other options I have (_GoodReads, Libib_, etc.) but none of these options seems to be suitable for my needs.
    - I know a little bit of Clojure/ClojureScript so I can get started.

### **Step 2: Determine the scope of what you want to learn**

- I want to build a real application that I can use for my own book management.
- I’ve identified various features - this will be an ongoing project.
    - I even have Trello board for tasks related to this project
- As a first milestone, I want to implement MVP using some libraries mentioned in [Web Development with Clojure](http://amzn.to/2lK9liF) book.
- I want to embrace REPL driven development combined with TDD - I’ll write a lot of tests.

### **Step 3: Define how the success will look like**

- My Bookshelf is up and running (at least on my local computer) and I’m able to add new books to bookshelf database, update or delete existing book, list all books, show book detail.
    - MUST-HAVE: basic attributes like “Title”, “Author”, “Year”, and “Status” (to distinguish books which I want to read/buy and those which I’ve already read/bought)
    - COULD-HAVE: further attributes can be added if useful for practical usage
    - NICE-TO-HAVE: the ability to search books by keywords on Amazon, show the results and be able to select the book which I want to add.
- Book database is persisted across different runs of the application.
- There’s at least primitive UI which can show me a list of books that I’ve added.
- I have an automated acceptance test checking the supported features.

### **Step 4: Find resources**

- **Books**
    - [Clojure applied](http://amzn.to/2kJawec)
    - [Web Development with Clojure, 2nd ed.](http://amzn.to/2lK9liF)
    - [Professional Clojure](http://amzn.to/2lPQcbe)
    - [Learning ClojureScript](http://amzn.to/2kJ31nw)_\-_ just for a reference
- **Clojure.spec**
    - _Probably not in the first iteration, but I definitely want to learn Clojure.spec and used it in my application_
    - [Introduction to clojure.spec](https://www.youtube.com/watch?v=-MeOPF94LhI) _-_ talk by Arne Brasseur on ClojureTRE 2016 
    - Intro to clojure.spec [https://lambdaisland.com/episodes/clojure-spec](https://lambdaisland.com/episodes/clojure-spec)
    - Check also: [https://vimeo.com/195711510](https://vimeo.com/195711510) (Rich Hickey on Clojure Spec)
    - _**Stuart Halloway screencast series**_**:** [https://www.youtube.com/playlist?list=PLZdCLR02grLrju9ntDh3RGPpWSWBvjwXg](https://www.youtube.com/playlist?list=PLZdCLR02grLrju9ntDh3RGPpWSWBvjwXg)
        - Excellent demonstrations of spec capabilities
- **re-frame tutorial**
    - [re-frame README](https://github.com/Day8/re-frame/blob/master/README.md)
    - [lambda island episodes](https://lambdaisland.com/episodes)
    - [http://dhruvp.github.io/2015/03/07/re-frame/](http://dhruvp.github.io/2015/03/07/re-frame/)
- **Real-world project examples**
    - Karel Miarka’s project: [https://github.com/kajism/liskasys](https://github.com/kajism/liskasys)
- series of tutorials on ClojureScript: [https://github.com/magomimmo/modern-cljs](https://github.com/magomimmo/modern-cljs)
    - can be used for a quick check if there’s a better solution for the problems I have in the implementation of client side of my project

### **Step 5: Create a learning plan**

1. **DONE.** Define learning strategy & resources
2. Read the first parts of [Clojure applied](http://amzn.to/2kJawec) and [Web Development with Clojure, 2nd ed.](http://amzn.to/2lK9liF) to know how to start
3. Create application skeleton - client and server part -> Display hello world
4. Create the first draft of application domain; in-memory store
5. Write some tests
6. Primitive read-only UI showing the book list
7. Persist entities to survive application restart
8. UI for adding a new book
9. UI for updating & deleting existing books
10. Redesign domain/data model based on recent experience
    - Use Clojure.spec?
11. Add possibility to store details (notes) about the book
12. Book tags
13. Add basic search
14. Track/watch books
15. **Iterate adding new features**; evaluating different options/libraries/frameworks

### **Step 6: Filter the resources**

Most important resources from step _4\. Find resources_:

- [Clojure applied](http://amzn.to/2kJawec)
- [Web Development with Clojure, 2nd ed](http://amzn.to/2lK9liF)
- re-frame tutorial

### **Step 7: Learn enough to get started**

One example could be _Reading the first chapter in [Web Development with Clojure, 2nd ed.](http://amzn.to/2lK9liF) and then generating new project structure from leiningen template._

### **Step 8: Play around**

For example: _Examine the application skeleton generated in the previous step and play with the application in REPL. Try to execute some DB queries and make sure you are familiar with each important part of the project structure._

### **Step 9: Learn enough to do something useful**

The result of this step should be adding a new feature to your project, e.g. _Implementation of “Add a New Book” feature._

### **Step 10: Teach**

Teach what you learned to others. This is a great way to make sure you have a solid understanding of the material you’ve learned. The other persons can be your colleagues, friends, local meetup group, readers of your blog, or even your spouse.

## **6 steps**

While outlining the 10-step learning process and executing it on a daily basis, it can help you to think about 6 steps which Steve Scott mentions in his book [Novice to Expert: 6 Steps to Learn Anything, Increase Your Knowledge, and Master New Skills](http://amzn.to/2kwEWPM).

This book deserves its own blog post, so I’ll just very briefly summarize the 6 steps:

1. **Identify your learning style**
    - Different people tend to favor different learning styles - social, solitary, visual, aural, verbal, physical, logical.
    - Try to identify 2-3 learning styles which suit you best and embrace them.
2. **Pick a skill you’d like to master**
    - Choose a single skill - identify #1 goal you’d like to accomplish.
    - Focus on one skill at a time.
    - Pick your desired level of expertise.
3. **Build the learning habit**
    - The quickest path to skill mastery is to focus on this area completely.
    - Focus on daily training.
    - Practice just-in-time learning - research information related to the next step, ignore everything else.
4. **Take actionable notes**
    - Check out [Cornell Method](http://coe.jmu.edu/learningtoolbox/cornellnotes.html). It’s a very useful way to capture, understand and review a learning material.
5. **Build a project around a skill**
    - In order to learn something, you need to practice it.
    - Create a real-world project for the skill you want to master and apply the things you’ve learned in the project.
6. **Deliberate practice**
    - Deliberate practice is the most important thing; talent is usually of minor importance.

## **Final thoughts**

I’ve provided you with an example how to create a learning strategy for Clojure project. I’ll definitely write more blog posts about my _My Bookshelf_ learning project in the future.

For more on How to discover your learning style, Pickup the skill you’d like to master, Building the learning habit, Taking actionable notes, Building a project around a skill and Deliberate practice, you can read the [Novice to Expert book](http://amzn.to/2kwEWPM) or just wait until I write a blog post about it :).

**Now, go ahead and pick a new skill you’d like to learn. Then create your learning plan and start executing it.**
