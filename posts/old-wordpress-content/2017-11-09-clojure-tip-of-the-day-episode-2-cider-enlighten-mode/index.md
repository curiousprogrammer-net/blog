---
title: "Clojure Tip of the Day - Episode 2: Cider Enlighten Mode"
date: "2017-11-09"
---

The new episode of my [Clojure Tip of the Day](https://curiousprogrammer.net/clojure-tip-of-the-day-screencast/) screencast is out.

You can find the video on YouTube: [https://youtu.be/tCu2AewBTR4](https://youtu.be/tCu2AewBTR4)

The episode covers the _**[cider-enlighten-mode](https://cider.readthedocs.io/en/latest/miscellaneous_features/#enlighten-display-local-values)**_. This mode can be used to quickly show values of local symbols and return values of functions in real time. Unfortunately, the feature is [not available in ClojureScript buffers](https://github.com/clojure-emacs/cider/blob/master/doc/caveats.md).

Notice, that unlike for [cider-debugger](http://cider.readthedocs.io/en/latest/debugging/) _(cider-debug-print-length_ and _cider-debug-print-level__),_ there's no option to customize the _print-length_ for the enlighten mode (see _Cider implementation details_ below).

### **Cider implementation details**:

- main function handling enlighten mode: [_cider--handle-enligthen_](https://github.com/clojure-emacs/cider/blob/ba66d222a8ce4c1b1b2f5ced3ce8143334ceae1e/cider-debug.el#L646)
- [hardcoded limit](https://github.com/clojure-emacs/cider-nrepl/blob/master/src/cider/nrepl/middleware/enlighten.clj#L13) (\*print-length\* 3) in cider-nrepl
- [Pull Request #1545](https://github.com/clojure-emacs/cider/pull/1545) that introduced the cider-enlighten-mode
