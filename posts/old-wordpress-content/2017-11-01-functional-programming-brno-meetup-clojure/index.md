---
title: "Functional Programming Brno Meetup: Clojure"
date: "2017-11-01"
---

Last week, I gave a [talk about Clojure](https://www.meetup.com/fpbrno/events/243877465/) at [Functional Programming Brno meetup](https://www.meetup.com/preview/fpbrno).

This was my first meetup talk and my first public Clojure presentation too. I'm very grateful for the experience. It was fun, and I met a couple of interesting people.

## Organization

[Kiwi.com](https://www.kiwi.com) and especially Jiří Nečas helped a lot with meetup organization. They provided free beers and some food. It was a first-class experience - I truly appreciate everything they did.

Also, all the attendees were very kind and patient with me. Big thank you to everyone, especially Tomáš Janoušek and the former organizer Matej Kollár.

I hope to find more speakers for the next Functional Programming Brno meetups. If you have any experience with FP and would like to share it with us, please, [send me a message via Meetup.com.](https://www.meetup.com/members/75616542/)

## Presentation

My presentation was based on a wonderful talk [Clojure in 10 Big Ideas](https://www.google.cz/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0ahUKEwjBsqCP_JzXAhUD-6QKHSLRBuwQFggmMAA&url=https%3A%2F%2Fgithub.com%2Fstuarthalloway%2Fpresentations%2Fwiki%2FClojure-in-10-Big-Ideas&usg=AOvVaw2RuDTnbLJIpsoJ4UYvUoUZ) by Stuart Halloway. I added a brief Clojure introduction at the beginning and some bits about Clojure in the real world at the end. I reduced the number of ideas to seven (leaving out core.async, protocols, and logic programming).

The presentation focused on people unfamiliar with Clojure. I tried to cover quite a few concepts, and that's why it was so long (1h 45 min). In the future, I certainly need to make my talks shorter.

I divided the talk into four parts:

### 1\. [Clojure in Action](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/5)

A very brief introduction to Clojure syntax using [simple hello world](https://github.com/jumarko/presentations/blob/master/clojure-presentation/src/clojure_presentation/00_hello.clj) covering [basic function definition](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/6).

### 2\. [Clojure Fundamentals](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/7)

A quick tour of Clojure (dynamic, functional with an emphasis on immutability, LISP, hosted on the JVM, etc.).

I also mentioned important Clojure ideas:

- [Simplicity](http://www.infoq.com/presentations/Simple-Made-Easy)
- Separation of identity and state

### 3\. [Clojure in 7 Big Ideas](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/13)

The core of the presentation. [Seven ideas](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/69) selected from Stuart's 10 Big Ideas:

1. EDN
2. Persistent Data Structures
3. Sequences
4. Transducers
5. REPL
6. ClojureScript
7. Spec

After each section, I demonstrated [the examples](https://github.com/jumarko/presentations/tree/master/clojure-presentation/src/clojure_presentation) in REPL. Most of them were very basic. After the _Sequences_ section, I included bit longer demo: [Game of Life](https://github.com/jumarko/presentations/blob/master/clojure-presentation/src/clojure_presentation/03_game_of_life.clj). I also demonstrated the [Game of Life visualization in a browser](https://github.com/jumarko/presentations/tree/master/game-of-life) after the _ClojureScript_ part.

### 4\. [Clojure in the Wild](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/72)

A summary of tooling, "problems" with Clojure (e.g. error reporting), real-world Clojure usage, and community resources.

I used the results of Clojure survey: [State of Clojure 2016 Results and Analysis](http://blog.cognitect.com/blog/2017/1/31/state-of-clojure-2016-results).

## Resources

Slides, audio & video recordings are available:

- Video (screen) recording: [https://youtu.be/YeUOWaM\_Gk8](https://youtu.be/YeUOWaM_Gk8)
- Slides: [https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/](https://www.slideshare.net/FPBrno/fpbrno-20171024-clojure-a-functional-lisp-on-the-jvm/)
- Audio recording: [https://soundcloud.com/fpbrno/fpbrno-clojure-presentation-oct-24-1809](https://soundcloud.com/fpbrno/fpbrno-clojure-presentation-oct-24-1809)
- Clojure samples from the presentation: [https://github.com/jumarko/presentations/tree/master/clojure-presentation/src/clojure\_presentation](https://github.com/jumarko/presentations/tree/master/clojure-presentation/src/clojure_presentation)
- Game of Life in ClojureScript: [https://github.com/jumarko/presentations/tree/master/game-of-life](https://github.com/jumarko/presentations/tree/master/game-of-life)

Almost all the stuff presented at the meetup come from one of the following resources:

- [**Stuart Halloway on Clojure in 10 Big Ideas**](https://vimeo.com/223240720)
- [Rich Hickey: Simple Made Easy](http://www.infoq.com/presentations/Simple-Made-Easy)
- [Alex Miller: Cracking Clojure](https://www.slideshare.net/alexmiller/cracking-clojure)
- [Game of Life in Clojure](https://www.youtube.com/watch?v=hr8RnTfijx0) \[in Czech\]
- [https://clojure.org/](https://clojure.org/)
- [Transducers workshop](https://github.com/uswitch/transducers-workshop/blob/master/slides/01-xducers-intro.pdf) - uSwitch
- [Clojure Pills Screencast: 017 the life and death of an s-expression](https://www.youtube.com/watch?v=Uv9fyDTIPig)
- [Bruce Hauman - Developing ClojureScript with Figwheel](https://www.youtube.com/watch?v=j-kj2qwJa_E)
- [State of Clojure 2016 Results and Analysis](http://blog.cognitect.com/blog/2017/1/31/state-of-clojure-2016-results)
