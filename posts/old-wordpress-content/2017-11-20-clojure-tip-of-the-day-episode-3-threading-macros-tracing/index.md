---
title: "Clojure Tip of the Day - Episode 3: Threading Macros Tracing"
date: "2017-11-20"
---

The third episode of my [Clojure Tip of the Day](https://curiousprogrammer.net/clojure-tip-of-the-day-screencast/) screencast is out.

You can find the video on YouTube: [Clojure Tip of the Day - Episode 3: Threading macros tracing](https://youtu.be/z5pe9ydcYoI)

The episode shows a quick "debugging" technique using the `println` function to print intermediate values flowing through the threading macros to the standard output.

### TL;DR

- For [thread-first macro](https://clojuredocs.org/clojure.core/-%3E) you can use `(doto println)` to quickly print intermediate value
- Usually, it's better and more convenient to introduce little helper function _**spy**_ : `(def spy #(do (println "DEBUG:" %) %))` which then works for all threading macros
- If you want to use _doto_\-like method then you need to wrap in an anonymous function: `(#(doto % println))` (notice extract parentheses - see macro-expansion of threading macros)

###  Credit

Thanks to [Sean Corfield](https://twitter.com/seancorfield) and [Brandom Adams](https://github.com/emidln) for providing the tips on the [Clojurians slack channel](https://clojurians.slack.com).
