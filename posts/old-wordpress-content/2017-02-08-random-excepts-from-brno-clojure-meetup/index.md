---
title: "Random excerpts from Brno Clojure Meetup"
date: "2017-02-08"
---

Last week, I was quite happy to attend [_(:brno Clojure)_ meetup](https://www.meetup.com/brno-clojure/events/236693370/). There were only five people including me. Nevertheless, we had a great time and covered a lot of topics. There was no main theme, just live free and spontaneous discussion about our experience with Clojure. We discussed following topics:

- server-side template [duct](https://github.com/duct-framework/duct)
- - easy-to-use template for getting started with Clojure web applications
    - how is it different from [chestnut](https://github.com/plexus/chestnut)?
- [liskasys](https://github.com/kajism/liskasys)
- - Karel Miarka’s own project
    - Uses Datomic
- Emacs/Spacemacs vs. Cursive
- - Spacemacs has lots of preconfigured plugins => easier to use than plain Emacs
- Korma SQL
- - macro magic
    - consider using something else (Honey SQL, plain clojure.java.jdbc, …)
    - Check [https://yogthos.net/posts/2016-02-22-LuminusEmbracingHugSQL.html](https://yogthos.net/posts/2016-02-22-LuminusEmbracingHugSQL.html)
- “Specs” for re-frame _application state db_
- - It can be better to not enforce using spec for _app-db_ because the additional value is not so high and it can lead to tedious updates of spec whenever you add something to _app-db_
- Usefulness of namespaced keywords
- - avoid conflicts: same keywords in different namespaces
- Pitfalls of debugging CLJS
- - unclear error messages
    - hard to find root cause
- Logging
- - log whole Clojure data structure instead of standard log lines?
    - - you can then process logs with clojure (search, filter, …)
- Using Ansible for automatic deployment
- [Component reloaded workflow](http://thinkrelevance.com/blog/2013/06/04/clojure-workflow-reloaded)
- - figwheel-like experience on backend
- Figwheel
- - re-load on save vs. reload explicitly (triggered by keyboard shortcut)
    - explicit reload gives us a better control
- **Ideas for next meetups**
- - Applications / System showcases
    - - demonstrate the apps we are working on
        - discussion, best practices
    - Coding dojo - we can work together on 4clojure problems or similar
    - Invite [Pavel Tisnovsky](https://www.linkedin.com/in/paveltisnovsky/) to Brno Clojure meetup

I’m really looking forward to the next Brno Clojure meetup.

I’d be love to see more people there as well.
