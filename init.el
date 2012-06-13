;; common lisp support
(require 'cl)

;; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/customizations")
;;(add-to-list 'load-path "~/.emacs.d/vendor")

;; packages
(require 'package)
(package-initialize)

;; add package sources
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; run emacs prelude to install missing packages
(load "prelude-packages")

(load "customizations/keys")
(load "customizations/theme")
(load "customizations/editing")
