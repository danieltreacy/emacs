;; enable Common Lisp support
(require 'cl)

;; add to load paths
(load-file "~/.emacs.d/utilities/vendor.el")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/daniel")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; add vendor packages
(vendor 'magit)
(vendor 'jump)
(vendor 'inf-ruby)
;(vendor 'rinari)
(vendor 'ruby-hacks)
(vendor 'textile-mode)
(vendor 'yaml-mode)
(vendor 'coffee-mode)
(vendor 'scss-mode)
(vendor 'scala-mode)
(vendor 'smart-tab)
(vendor 'color-theme)
(vendor 'color-theme-solarized)

;; load customizations
(load "daniel/custom")
(load "daniel/keys")
(load "daniel/theme")
(load "daniel/ruby")
