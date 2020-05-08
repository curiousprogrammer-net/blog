---
title: "Clojure Development Workflow with Spacemacs and CIDER"
date: "2017-05-12"
---

_This is a follow-up to my previous post [What’s the Best Clojure IDE?](https://curiousprogrammer.net/2017/03/21/whats-the-best-clojure-ide/) I'll show you my usual Clojure development workflow using Spacemacs+CIDER as primary tools._

I've already described my tour through the various Clojure IDEs/editors and why I've chosen the Spacemacs. If you haven't read the [previous post](https://curiousprogrammer.net/2017/03/21/whats-the-best-clojure-ide/), you may want to go back and read at least the [Spacemacs to the rescue](https://curiousprogrammer.net/2017/03/21/whats-the-best-clojure-ide/#spacemacs-to-the-rescue) part.

In this post, I'll try to dig deeper and show you the complete development workflow. I've chosen video screencast as a primary format for this because I think it's more useful to see everything in action.

We'll create a simple _clojure-repl_ project containing the _jmethods_ function for listing all public methods of java classes.

You can find **[the video](https://www.youtube.com/watch?v=4ecC3jqHooc)** in the [Curious Programmer YouTube channel](https://www.youtube.com/channel/UCD_9SmDPrAe-sZAfSB9tjdg).

Below is a brief summary of topics/tips presented in the screencast.

## Summary

- Generate new leiningen project: _lein new clojure-repl_
- Open Spacemacs
- Create new layout: `SPC l 2`; enter layout name: _clojure-repl_
- Open _clojure-repl/__project.clj_ by pressing `SPC f f` and looking up the file on a file system
- Open _Neotree_ buffer via `SPC p t` to explore project structure
    - You can navigate in this buffer via standard vim key bindings: `j, k, l, h`. You can also press `?` to open the help
- Clean the initial project skeleton and commit them via magit: `SPC g s`
    - Expand/collapse the changes by pressing `TAB`
    - Stage the changes for commit by pressing `s`
    - Commit the staged changes by `c c`
- Create java.clj file in the Neotree buffer by pressing `c` ("create") and entering the name of the file.
- Run _cider-jack-in_ by `, '`
- Switch between REPL and java.clj buffer using `C-c C-z`
- Evaluate the java.clj buffer via `, e b`
- Evaluate the function at a point by `, e f`
- Send results from java.clj buffer to the REPL using `, s e` while keeping cursor right after the form you want to evaluate
- Use _clojure.core/bean_ function to examine the properties of java class
- Reformat a buffer with `, =` to make sure that your code is compliant with [Clojure style guide](https://github.com/bbatsov/clojure-style-guide)
- Use `SPC k s` for "forward slurp"
- Use _cljr-add-missing-libspec_ `, r a m` to add a require unknown symbols (e.g. _clojure.string/join_) automatically
- Show documentation popup with `, h h`
- Navigate to source code by `, g g`
    - works both for Clojure functions and Java classes
    - make sure that you have JDK sources installed on your system - [CIDER will add them automatically to the classpath](https://github.com/clojure-emacs/cider-nrepl/blob/master/src/cider/nrepl/middleware/util/java.clj#L47)

### Bonus

Additional tips mentioned at the end of the video:

- Describe key bindings via `SPC ?`
- Start with `M-x` and type in the "cider-" and/or use menu bar (F10) to search for CIDER commands and explore CIDER capabilities
- Add new dependencies to project.clj and hot-load them into the REPL via `, r a p`
- _cider-inspect-last-result_
    - press ENTER to deep dive
    - press `C-z` to switch into the Emacs mode and then `l` to go up
- Use `SPC /` for a quick search within the project
    - You can also use `C-c C-e` to enter the edit mode and replace the text
- Type `*` for a quick search/highlight of a symbol under the cursor
- Display online java doc for Java class with `, h j`
- Add Clojure sources to the project.clj/profiles.clj to be able to navigate to clojure.core java classes, e.g. _clojure.lang.PersistentVector_
- **Not covered in video**
    - _cider-browse-ns_ `, h n` to list all the functions in given namespace together with a documentation preview
    - _cider-refresh _ `, s x` to test everything in a fresh environment
    - CIDER debugger - debug function at the point: `, d b`
        - [debug mode key bindings](https://cider.readthedocs.io/en/latest/debugging/#keys)

## Resources

- **[Youtube video](https://www.youtube.com/watch?v=4ecC3jqHooc)**
- [clojure-repl project on GitHub](https://github.com/jumarko/clojure-repl/blob/master/src/clojure_repl/java.clj)
    - besides the _jmethods_ function, there are also _jconstructors_ and _jinfo_ functions which are not shown in the video
- [F(by) 2016 - Bozhidar Batsov - Speech 2 - Deep Dive into CIDER](https://www.youtube.com/watch?v=aYA4AAjLfT0) - Bozhidar's talk demonstrating many cool CIDER's features
- [Spacemacs - From First Install to Clojure programming without manual configuration](https://www.youtube.com/watch?v=Uuwg-069NYE) - very good and short Spacemacs introductory video
- [Development Workflow with Spacemacs](https://www.youtube.com/watch?v=k5X2Hb3tc2s) - quick video introduction with generic spacemacs tips; shows more "git magic" using _magit_
- [Instaparse library](https://github.com/Engelberg/instaparse)
