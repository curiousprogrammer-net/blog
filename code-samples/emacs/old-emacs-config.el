(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(server-start)

;; always show line numbers
(global-linum-mode t)

;;; Install useful packages
;;; Note: project explorer is painfully slow for large project"
;;; Use Neotree instead: https://www.emacswiki.org/emacs/NeoTree#toc8
(add-to-list 'load-path "~/workspace/emacs/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; Every time when the neotree window is opened, let it find current file and jump to node.
(setq neo-smart-open t)
(setq neo-window-fixed-size nil)

(defvar my-packages '(ace-window
                       aggressive-indent
                       better-defaults
                       cider
                       clj-refactor
                       clojure-mode
                       ;; auto complete
                       company
                       exec-path-from-shell
                       markdown-mode
                       projectile
                       rainbow-delimiters
                       smartparens
                       smex
                       go-mode))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; tweak ace-window configuration
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; install http-twiddle manually
;; check https://github.com/hassy/http-twiddle
;; and http://ergoemacs.org/emacs/emacs_installing_packages.html
(add-to-list 'load-path "~/.emacs.d/my-packages/")
(load "http-twiddle")

;; install slamhound (clojure namespace dependencies) manually
;; https://github.com/technomancy/slamhound/blob/master/slamhound.el
(load "slamhound")
;; initialize emacs PATH to be the same as shell's path
;; can help prevent cider issues: https://github.com/clojure-emacs/cider/issues/1819
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; enable projectile globally
(projectile-global-mode)

;; ace-window shortcuts

(global-set-key (kbd "C-o") 'ace-window)

;;; clojure and similar packages
;;; check https://github.com/clojure-emacs/clojure-mode

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
           (catch Throwable _))
         (eval '(do (figwheel-sidecar.repl-api/start-figwheel!)
                  (figwheel-sidecar.repl-api/cljs-repl)))

         (try
           (require 'cemerick.piggieback)
           (resolve 'cemerick.piggieback/cljs-repl)
           (catch Throwable _))
         (eval '(cemerick.piggieback/cljs-repl (cljs.repl.rhino/repl-env)))

         :else
         (throw (ex-info \"Failed to initialize CLJS repl. Add com.cemerick/piggieback and optionally figwheel-sidecar to your project.\" {})))")
;; Hooks fro clojure-mode
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; indentation for clojure-mode
;; check https://github.com/clojure-emacs/clojure-mode#indentation-options
(setq clojure-indent-style :always-indent)

;; smartparens
(global-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-M-e") 'sp-end-of-sexp)
(global-set-key (kbd "C-M-f") 'sp-forward-sexp)
(global-set-key (kbd "C-M-b") 'sp-backward-sexp)
(global-set-key (kbd "C-M-n") 'sp-next-sexp)
(global-set-key (kbd "C-M-p") 'sp-previous-sexp)
;; wrapping shortcuts
(defmacro def-pairs (pairs)
  `(progn
     ,@(loop for (key . val) in pairs
             collect
             `(defun ,(read (concat
                              "wrap-with-"
                              (prin1-to-string key)
                              "s"))
                (&optional arg)
                (interactive "p")
                (sp-wrap-with-pair ,val)))))
(def-pairs ((paren . "(")
            (bracket . "[")
            (brace . "{")
            (single-quote . "'")
            (double-quote . "\"")
            (back-quote . "`")))
(global-set-key (kbd "C-c (") 'wrap-with-parens)
(global-set-key (kbd "C-c [") 'wrap-with-brackets)
(global-set-key (kbd "C-c {") 'wrap-with-braces)
(global-set-key (kbd "C-c '") 'wrap-with-single-quotes)
(global-set-key (kbd "C-c \"") 'wrap-with-double-quotes)
(global-set-key (kbd "C-c `") 'wrap-with-back-quotes)
;; slurping and barfing - notice that "C-)" and "C-(" don't work
;;(global-set-key (kbd "C-)") 'sp-forward-slurp-sexp)
(global-set-key (kbd "M-)") 'sp-forward-slurp-sexp)
;;(global-set-key (kbd "C-(") 'sp-backward-slurp-sexp)
(global-set-key (kbd "M-(") 'sp-backward-slurp-sexp)
;;(global-set-key (kbd "M-)") 'sp-forward-barf-sexp)
;;(global-set-key (kbd "M-(") 'sp-backward-barf-sexp)
;;; autocompletion

;; to use company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)
;; To make TAB complete, without losing the ability to manually indent, you can add this to your config:
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

;; Smex for mini-buffer completion
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; autostart
(require 'smex)
(smex-initialize)
;;; CSS
(setq css-indent-offset 2)
;;; copy-paste between Emacs and Mac OS X clipboard
;;; check http://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
;;; JavaScript

;; Set Indentation level to 2 (default 4)
;; see http://stackoverflow.com/questions/18976329/how-to-set-2-spaces-indent-in-javascript-mode-in-emacs
(setq js-indent-level 2)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages
     (quote
       (go-mode ag csv-mode slamhound smex smartparens rainbow-delimiters projectile project-explorer popup markdown-mode exec-path-from-shell company clj-refactor better-defaults aggressive-indent
                ace-window))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
