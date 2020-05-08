---
title: "Defn Podcast Episode 30 – Bruce Hauman"
date: "2018-02-15"
---

_This is a summary of the defn podcast interview with Bruce Hauman._

Once again, it's been a [great and long episode](https://defn.audio/episodes/2018/02/10/bruce-hauman.html) where Ray and Vijay talked to [Bruce Hauman](https://github.com/bhauman). You'll find my notes below.

These are my notes to help me quickly review the key information. I might have misinterpreted something. I encourage you to listen to the [full episode](https://defn.audio/episodes/2018/02/10/bruce-hauman.html).

 

## **Summary**

- Name _Hauman_ has German origin.
- **How he got to Clojure and Figwheel**
    - He likes languages, parsing et al.
    - He has always had a passion for LISP - he was LISPer for a long time (since college).
    - In the real world, you work with Ruby, PHP, Java, etc.
        - As a result, he got sick and started to play with ClojureScript - there were quite a few rough edges and thus he created [Figwheel](https://github.com/bhauman/lein-figwheel).
    - Now Bruce lives in a typical apartment in Montreal.
        - See his talk [Developing ClojureScript With Figwheel](https://youtu.be/j-kj2qwJa_E?t=557) with the picture of his former "plastic bubble" house :).
    - ClojureScript doesn't "encapsulate" functions and modules.
        - You can just load the file, and all your definitions are reloaded => very easy.
        - If you want to do stateful stuff like [https://threejs.org/](https://threejs.org/) it becomes problematic => you can turn auto-loading on and off with Figwheel.
    - Using Figwheel with Node.js is different.
        - You have no display and feedback is less visible.
- Joke: _he's not a real programmer, he just build cool demos that make people think._
    - Figwheel is quite complicated real application written in Clojure.
- He recently built some application with Clojure and Ethereum - that was a really cool experience.
- **Clojure as a strange maximum**
    - He doesn't see himself gravitating to other languages (although he loves languages a lot).
    - In terms of getting things done, he sees little benefits in using other languages.
- **Static types**
    - The static guys are overblowing guarantee they're getting from types - in real-world complex systems with lots of state (think "Microservices") the benefits are diminished.
    - In Clojure we are very productive - look at [Advent of Code](https://github.com/bhauman/advent-of-clojure) and compare Clojure solutions to other languages.
    - Ray: certain types of functions would benefit from types but exploring external resources and APIs/data is much easier without types ceremony.
    - Racket, gradual typing, etc. (Vijay asked Bruce what he thinks about that and what's his experience)
        - Paying upfront cost with types doesn't make much sense to him because so much programming is about exploration - Bruce prefers to have the flexibility to explore.
- **Building new Clojure/ClojureScript app** - what are his libraries/tools of choice?
    - Pick as few libraries as possible.
    - He (always) uses React for frontend applications.
    - He prefers Om style - passing state explicitly to downstream components instead of referencing global state.
        - But he didn't do much ClojureScript development in the last year or so (e.g. re-frame got a lot better)
    - In lots of applications, you don't need to make decisions about _REST_ and _GraphQL_ until you reach a certain size.
        - just pushing JSON data through APIs
        - If you know exactly what you're building and how big it's gonna be then it might be useful to pay that cost upfront.
- [**_Strictly-specking_ library**](https://github.com/bhauman/strictly-specking)
    - It was written mostly for the purpose of checking Figwheel/ClojureScript configuration options of which there are many and they're easy to get wrong.
    - He started to write it in core.logic, then spec came out and he re-wrote it using spec.
        - Back then, spec was missing some features (it wasn't so easy to get an exact pointer to the problem inside the input data structure).
        - After that, there were some improvements to spec which made his job easier.
- **Spec error messages**
    - Concerning Clojure.core we're talking about macros and special forms.
        - You get very detailed error messages - however, programming is a very incremental activity, and you just need a very brief and clear error message.
        - BUT, you can write a library that will match certain spec errors for core macros and output precise and clear user-facing error messages.
    - When saying "better error messages", it helps to be a lot more precise what does that mean - e.g. "We need a concise error message along with a pointer to the start and the end of the relevant code."
        - Unfortunately, that pointer is contextual - it depends on the file in which you are, etc.
    - Bruce really wants better error messages to bring more people to Clojure - that's the reason why he is writing _[rebel-readline](https://github.com/bhauman/rebel-readline)._
- [_**Devcards**_](https://github.com/bhauman/devcards)
    - All Bruce's projects are focused on bringing Clojure interactivity to people.
    - When writing browser applications you always run in a broader context of the browser.
    - Devcards' idea is that it should be easy to create independent pieces of an application and have them together.
- **Future** (ideas about Fighweel and more)
    - Spec errors descriptions
    - Keeping statistics and visual history of errors and messages.
- [_**rebel-readline**_](https://github.com/bhauman/rebel-readline)
    - _Story_
        - He does [Advent of Code](https://github.com/bhauman/advent-of-clojure) every year.
        - Working on programming projects let you reflect on our programming experience.
        - [TIS 100 - assembly language programming  game](http://www.zachtronics.com/tis-100/) - the easiest way to learn assembly programming again.
        - REPL is kind of a game - idea of building challenges in REPL; he never got too far with this.
    - Experienced Clojure programmers don't need a great REPL experience, but beginners need it.
        - When you're new to Clojure it's impossible to choose an editor - everybody says: "Cursive, Emacs, Atom, ..."
        - Ray: he struggled for one year or so to grasp the REPL - it's really a superpower of Clojure and now he uses it all the time.
    - [JLine](https://github.com/jline/jline3) provides a lot of functionality and makes things a lot easier.
    - _rebel-_readline is practically an editor, and you can put many features there, but it's already great.
    - IPython-like notebooks
        - Not being in a file feels very constraining.
        - You can use Devcards as a graphical REPL in a browser, and you have your code in a file!
    - Reddit discussion: [Pre-release of rebel-readline by Bruce Hauman! :D](https://github.com/bhauman/rebel-readline/blob/master/README.md)
        - _But the greatest benefit for me is that we can finally show newcomers an almost proper Clojure workflow without sending them to setup Emacs/vim/Cursive first._
    - [**crepl** project idea](https://www.youtube.com/watch?v=kzbnk-zmSN0)
        - collaborative REPL
        - Nice idea but they eventually ran out of money.
        - Tmux can be used for shared typing into REPL but you can't see who's typing what and when he typed.
        - Joke: _with Clojure we don't need multiple people; we're so productive that just one man is enough._
    - Bruce would like to have repl_\-_readline ready for getting people's feedback in a couple of weeks.
- **JavaScript experience**
    - Bruce enjoyed JavaScript back in time because of its dynamic nature.
    - If he had a choice, he'd choose CoffeeScript.
- [_**Clojurists Together**_](https://clojuriststogether.org/) **initiative**
    - Figwheel is one of the sponsored projects.
    - It's great; please join in and support Clojure open source projects!
