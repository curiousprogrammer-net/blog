---
title: "Defn Podcast Episode 30 - Zach Tellman"
date: "2018-02-10"
---

_This is a summary of the defn podcast interview with Zach Tellman._

It was a wonderful [30th episode of the defn podcast](http://defn.audio/episodes/2018/01/27/zach-tellman.html) where they interviewed Zach Tellman. As is so often the case with Zach's talks, it's a great discussion full of insights.

I usually take personal notes for many podcasts that I listen to (see [Busy (Clojure) Developer Guide to Podcasts](https://curiousprogrammer.net/2017/09/18/busy-clojure-developer-guide-to-podcasts/)). The reasons are to help me remember more and sometimes be able to do a quick review without a need to re-listen the whole thing.

Most of the podcasts that I listen to have only very brief show notes. And it's very true for defn podcast too. Therefore, I decided to put together a somewhat longer version. Beware that these are my own interpretations and because I wrote them down while walking and listening they may also be slightly incorrect. I encourage you to listen to the whole episode, take your own notes and draw your conclusions.

You can also expect more podcasts' summaries on this blog in the future.

## Show notes

- **[Elements of Clojure](http://elementsofclojure.com/)**
    - This is Zach's new self-published book that has already been available for some time.
    - There's also a [discussion forum](https://groups.google.com/forum/#!forum/elements-of-clojure) dedicated to the book.
    - He started the first serious work on this topic two years ago.
    - He didn't anticipate how much work it would be and spent a lot of time reading many resources on the topic.
- Lot of code we (programmers) write is a _**throw-away code**_
    - More frequent in LISP community.
    - It's okay many times.
    - Writing reusable code is hard.
- **Correctness & proofs**
    - 1972 paper: [_Proof of correctness of data representations_](https://link.springer.com/article/10.1007/BF00289507)
    - People should stop talking about software being correct and talk about software being _**self-consistent.**_
    - The hardest problem is to write software that's useful when it's outside of its usual environment.
- **Dynamic vs. static typing**
    - Having some dynamism at the edges of your system is useful.
    - The real world doesn't have schemas.
    - Clojure's unique feature is that it brings immutability into the ecosystem of dynamic languages.
    - Clojure is a very good language for writing glue between more "rigid" components in your system. Those components might be written in other, more static languages (often in the form of Java library used directly from Clojure).
- _**nil**_ **handling**
    - One thing that Zach considers less than ideal in Clojure is that you can end up with _**nil**_ propagating through half of the code only to eventually fail with NPE
    - The usual idiom _(when fn-arg (do stuff))_ is terrible
    - A lot of things in Clojure are designed to be concise. In some situations, it could be better to be explicit: e.g., requiring a default value for _clojure.core/get_
- **Clojure concurrency features**
    - _Why STM hasn't been as successful as expected_
        - STM makes things much more complicated (compared to a simple atom) while it gives us only small benefits (mostly under heavy contention).
        - We usually don't write systems with that heavy concurrency - we instead scale them by distributing load over multiple machines.
    - _core.async_ is mostly useful on the client side (ClojureScript)
        - People often use it on the server side even if there's no compelling reason to do so.
- **Laziness**
    - It can be tricky because there's no clear distinction between data in the process and outside the process (file, network, etc.)
        - Here's further discussion about push & pull concepts: [_Question: Not able to understand function pull, push and transform_](https://groups.google.com/forum/#!msg/elements-of-clojure/qPd--oNq7IU/vEXNtvsPAgAJ)
    - If Rich had known about transducers before Clojure 1.0 release, he would have made the laziness much less a default option in Clojure.
- **Light Table**
    - Venture capitalists aim at billion dollar businesses which is problematic for developer tools like Light Table - it's a pretty decent editor but it's not clear how much money this area can bring to investors
    - Light Table is a nice demonstration of [Bret Victor's ideas](https://www.youtube.com/watch?v=PUv66718DII)
- The great aspect of American culture is that it allows you to fail in your business => it encourages experimentation.
- **Zach's history**
    - He studied computer science at college.
    - He originally wanted to do games development, but later realized that it's not for him.
    - He spent some time at C# shop - working on low-level Windows graphics stuff.
    - He joined Google for a short period of time
    - Eventually, he started working for Clojure startup and has been with Clojure ever since
- Zach's successful open-source projects: [_**Aleph**_](https://github.com/ztellman/aleph) and _[**Manifold**](https://github.com/ztellman/manifold)_
- **Spec**
    - Spec is perhaps the first addition to Clojure in the last five years that can really change the way how programmers think about the language.
    - Spec error reporting is rather weak, though
        - Cognitect's approach to leave this as an exercise to a reader is less than ideal.
    - Spec is a clever technical solution to what is a fundamentally human problem.
        - To have a really good human-readable error messages you'd have to have a possibility to specify error message generator with every spec.
- _Mean-time-to-accomplish-something_ is an important criterion for new people starting with a programming language
    - For Zach, Clojure has been great in this aspect because it allowed him to do rapid experiments with OpenGL library
- **Community has to step in**
    - Start defining the best practices/libraries which should be used in the community.
    - One good example is [_**ring**_](https://github.com/ring-clojure/ring) library.
    - [https://clojuriststogether.org/](https://clojuriststogether.org/) is a nice initiative.
