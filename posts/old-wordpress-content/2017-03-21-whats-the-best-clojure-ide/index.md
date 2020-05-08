---
title: "What's the Best Clojure IDE?"
date: "2017-03-21"
---

_In this article, I'll evaluate the Emacs, Cursive, and_ Spacemacs_, and explain why I ended up with_ Spacemacs _for most of the projects I’m currently working on._

**UPDATE**: Check also my next blog post [Clojure Development Workflow with Spacemacs and Cider](https://curiousprogrammer.net/2017/05/12/clojure-development-workflow-with-spacemacs-and-cider/) with the [accompanying video](https://www.youtube.com/watch?v=4ecC3jqHooc).

It’s been a while since I started coding in Clojure, but the "IDE dilemma" was there from the beginning. Although some people might think that it’s a waste of time and you can just pick any editor you want, I disagree. There’s definitely a big difference in terms of productivity if you can use the best tool for the job.

## My Tour Through the Clojure IDEs' Country

### Emacs LIVE

In the beginning, I did a quick research and found out that many people in Clojure community use Emacs.

I had never really used Emacs. However, I found one particular Emacs incarnation, [Emacs LIVE](http://overtone.github.io/emacs-live/), specially crafted for beginners. Of course, there still was a big learning curve for me. I spent countless hours getting used to Emacs editing style, shortcuts, and quirks of Emacs LIVE.

On the one hand, it was packed up with useful plugins. On the other hand, its config was bloated, and it was slow to start.

Eventually, I was not able to distinguish if my problems (such as broken keyboard shortcuts for _slurp_ and _barf_) were related to the specifics of Emacs LIVE or if they were some general issues with Emacs or my Mac OS X configuration.

### Cursive

In the meantime, I also played with [Cursive](https://cursive-ide.com/).

As a long-time IntelliJ IDEA user, I happened to be familiar with the environment. I really love the features like Full-text search, Project tree window, Symbol navigation, Refactoring, Git integration, Live Templates, Database Plugin, and more.

However, for smaller projects, Cursive feels too heavy-weight:

- Its start up time is slower.
- ClojureScript and Figwheel integrations aren't very good (yet).
- Regarding plain old text editing, Vim and Emacs provide a better experience.

I love Cursive’s features and need them to be productive. I do think that [Colin Fleming](https://twitter.com/colinfleming) is doing a great job. But I also need something more lightweight which doesn’t consume a lot of resources.

### Emacs - From the Scratch

Being unable to fix some issues in Emacs LIVE, I finally stepped back and started with plain Emacs, adding only plugins I needed. Step by step, I added _projectile_, _project-tree-explorer_ (later replaced by NeoTree since _project-tree-explorer_ was painfully slow for large projects), _auto-complete_, _company-mode_, and more.

You can find my old Emacs configuration on [GitHub](https://github.com/jumarko/curious-programmer-blog/blob/master/code-samples/emacs/old-emacs-config.el). One interesting piece is the configuration for Figwheel.

;; Cider figwheel integration
(require 'cider)
;; more elaborate cider-cljs-lein-repl than in official documentation
;; this tries to match the project type
;; copied from https://lambdaisland.com/episodes/figwheel-emacs-cider
(setq cider-cljs-lein-repl
 "(cond
 (and (resolve 'user/run) (resolve 'user/browser-repl)) ;; Chestnut projects
 (eval '(do (user/run)
 (user/browser-repl)))
 (try
 (require 'figwheel-sidecar.repl-api)
 (resolve 'figwheel-sidecar.repl-api/start-figwheel!)
 (catch Throwable \_))
 (eval '(do (figwheel-sidecar.repl-api/start-figwheel!)
 (figwheel-sidecar.repl-api/cljs-repl)))
 (try
 (require 'cemerick.piggieback)
 (resolve 'cemerick.piggieback/cljs-repl)
 (catch Throwable \_))
 (eval '(cemerick.piggieback/cljs-repl (cljs.repl.rhino/repl-env)))
 :else
 (throw (ex-info \\"Failed to initialize CLJS repl. Add com.cemerick/piggieback and optionally figwheel-sidecar to your project.\\" {})))")

Previously, I struggled a lot with a proper setup for ClojureScript projects including browser-connected REPL, Figwheel and CIDER integration. [That Lambda Island episode](https://lambdaisland.com/episodes/figwheel-emacs-cider) finally got me some setup that worked.

Again, it took me non-trivial amount of time to configure my Emacs and learn new shortcuts. Yet I still had some issues with code formatting and usability. I was never quite happy with using Emacs for large projects, especially for the ones I wasn’t familiar with. Therefore, I ended up using Cursive for every larger code base I encountered.

 

## Spacemacs to the Rescue

Recently, I visited [The second Brno Clojure meetup](https://curiousprogrammer.net/2017/02/08/random-excepts-from-brno-clojure-meetup/) and had a great discussion with [Karel Miarka](https://www.meetup.com/brno-clojure/members/212709362/) about many topics, including Clojure editors. Instead of using plain Emacs, he recommended the [Spacemacs distribution](http://spacemacs.org/).

### Getting Started with Spacemacs

I found following resources to be perfect for getting started with Spacemacs:

1. Spacemacs documentation
    1. [Quickstart](http://spacemacs.org/doc/QUICK_START.html)
    2. [Full Documentation](http://spacemacs.org/doc/DOCUMENTATION.html)
2. [Clojure development with Spacemacs](https://practicalli.github.io/spacemacs/) from Practical.li

[The Introductory video](https://www.youtube.com/watch?v=Uuwg-069NYE) is fascinating and made me curious. If that’s how the Spacemacs works, maybe I can use Emacs again without frustration even for large real-world projects.

The downside: _I had to learn a little bit different workflow and shortcuts once again._ The upside: _easy and almost automatic configuration and good pre-configured plugins._

### My Spacemacs Configuration

Since Spacemacs configuration is almost automatic, I did a very little [custom configuration](https://github.com/jumarko/curious-programmer-blog/blob/master/code-samples/emacs/.spacemacs):

- I uncommented following _dotspacemacs-configuration-layers_ in _.spacemacs_ file (use shortcut `SPC f e d` for quick edit of .spacemacs file and `SPC f e R` for quick reload)
    - _helm_
    - _auto-completion_
        - By using this layer, you can automatically expand code snippets like `defn` via `M-/` (_yas-expand_) to simulate Cursive’s Live Templates
    - _better-defaults_
        - few enhancements of standard commands like _C-a, C-e, C-w, C-y, M-q_
    - _git_
        - [_magit_](https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bsource-control/git) provides an incredible Git experience inside the editor.
        - Start with _magit-status_: `SPC g s`
        - Unlike many developers who use the Git only from command line, I believe there's value in having strong Git integration within IDE. I used to use IniteliJ "Commit dialog" a lot and now I have a similar (and maybe even better) experience with magit.
- I activated _hybrid-mode_ instead of _default-mode:_ `dotspacemacs-editing-style 'hybrid`
    - This means that you can use emacs shortcuts like _C-a_ and _C-e_ when you are in vim editing mode - very useful!
- I turned on line numbers by default: `dotspacemacs-line-numbers t`
    - I can always turn them off via `SPC t n`

### CIDER

There’s a nice shortcut `,` (comma) which serves as a prefix for all Cider commands. For instance `, t a` will run all unit tests for current namespace. Alternatively, you can use `SPC m` prefix: `SPC m t a`

Other than that, Cider integration is just seamless and very similar to the ordinary Emacs.

### Layouts

[Layouts](http://boyanangelov.com/spacemacs/layers/+window-management/spacemacs-layouts/README.html) are one of the more useful features that I didn't use from the very beginning.

Basically, the _layout_ is a set of related buffers. Something you could call a _project_ in more traditional IDEs. The layout will help you to organize your buffers.

There is always at least one layout called _Default._ To create a new layout, press `SPC l` and then `2`. Type the name of the new layout and you're all set up. You can start creating new buffers. When you press `SPC l b`, you'll see only buffers assigned to the current layout (except the _Default_ one which contains all buffers).

## Final Thoughts

Nowadays, Spacemacs is my tool of choice for all Clojure projects - both small samples and large code bases with thousands lines of code. I think it's a great development environment with tons of useful features like Cider REPL, Git integration, Neotree explorer, layouts, and more. I found it more approachable for non-expert Emacs users than vanilla Emacs.

If I work on some project with lots of Java/JavaScript code in the future, I will probably switch back to Cursive.

### How About the Atom + Proto REPL?

A Few days ago, I watched the Clojure/conj talk [Proto REPL, a New Clojure Development and Visualization Tool](https://www.youtube.com/watch?v=buPPGxOnBnk) by Jason Gilman and it completely blew my mind. The debugging and visualization capabilities of Proto REPL are brilliant.

However, when I tried Atom with Proto REPL it just didn't feel right to me. To be honest, I didn't spend much time with it (I have other things to do besides testing all possible Clojure editors). For now, I feel more productive and organized with Spacemacs, so I'll stick with it. I'm pretty sure I'll revisit Atom + Proto REPL at some point in the future.

### Resources

- [http://dev.clojure.org/display/doc/IDEs+and+Editors](http://dev.clojure.org/display/doc/IDEs+and+Editors)
- [http://stackoverflow.com/questions/4248171/choosing-an-ide-editor-for-clojure-coding](http://stackoverflow.com/questions/4248171/choosing-an-ide-editor-for-clojure-coding)
- [https://www.quora.com/What-is-the-best-IDE-for-a-Clojure-beginner](https://www.quora.com/What-is-the-best-IDE-for-a-Clojure-beginner)
- [Clojure development with Spacemacs](https://practicalli.github.io/spacemacs/) from Practical.li
- [Spacemacs documentation](http://spacemacs.org/doc/DOCUMENTATION.html)
