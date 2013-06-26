
 ;;  _____   ______  __   __  __  ______  __      ______       ______  __    __  ______  ______  ______
 ;; /\  __-./\  __ \/\ "-.\ \/\ \/\  ___\/\ \    /\  ___\     /\  ___\/\ "-./  \/\  __ \/\  ___\/\  ___\
 ;; \ \ \/\ \ \  __ \ \ \-.  \ \ \ \  __\\ \ \___\ \___  \    \ \  __\\ \ \-./\ \ \  __ \ \ \___\ \___  \
 ;;  \ \____-\ \_\ \_\ \_\\"\_\ \_\ \_____\ \_____\/\_____\    \ \_____\ \_\ \ \_\ \_\ \_\ \_____\/\_____\
 ;;   \/____/ \/_/\/_/\/_/ \/_/\/_/\/_____/\/_____/\/_____/     \/_____/\/_/  \/_/\/_/\/_/\/_____/\/_____/


;; common lisp support
(require 'cl)

;; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/ensime_2.9.1-0.7.6/elisp/")
(add-to-list 'load-path "~/.emacs.d/vendor/malabar-1.5/lisp")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/jde/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/eieio"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/elib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/molokai"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scala-mode2"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/textmate"))

(load "customizations/functions")

;; load path and exec-path from system $PATH
(set-exec-path-from-shell-PATH)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;; lod rbenv from path
(set-rbenv-path)

;; load rsense
(setq rsense-home "~/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; yaml mode
;;(load-file (expand-file-name "~/.emacs.d/elpa/yaml-mode-0.0.7/yaml-mode.el"))
;;(require 'yaml-mode)

;; load cedet packages
(load-file (expand-file-name "~/.emacs.d/vendor/cedet/common/cedet.el"))
(semantic-load-enable-minimum-features) ;; or enable more if you wish
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/vendor/malabar-1.5/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; textmate mode
(require 'textmate)
(textmate-mode)

;; ensime
(require 'ensime)

;; scala-mode
(require 'scala-mode2)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "#559944"))))
 '(diff-context ((t nil)))
 '(diff-file-header ((((class color) (min-colors 88) (background dark)) (:foreground "RoyalBlue1"))))
 '(diff-function ((t (:foreground "#00bbdd"))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:foreground "RoyalBlue1"))))
 '(diff-hunk-header ((t (:foreground "#fbde2d"))))
 '(diff-nonexistent ((t (:inherit diff-file-header :strike-through nil))))
 '(diff-refine-change ((((class color) (min-colors 88) (background dark)) (:background "#182042"))))
 '(diff-removed ((t (:foreground "#de1923"))))
 '(flymake-errline ((t :underline "red")))
 '(flymake-warnline ((t :underline "green"))))
