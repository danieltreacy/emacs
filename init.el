;; common lisp support
(require 'cl)

;; set paths
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

;; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/ensime_2.9.1-0.7.6/elisp/")
(add-to-list 'load-path "~/.emacs.d/vendor/mew-6.5/")

(require 'ensime)

;; packages
(require 'package)
(package-initialize)

;; add package sources
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; run emacs prelude to install missing packages
(load "prelude-packages")

(load "customizations/ensime")
(load "customizations/keys")
(load "customizations/editing")
(load "customizations/theme")
