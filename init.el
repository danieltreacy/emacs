
 ;;  _____   ______  __   __  __  ______  __      ______       ______  __    __  ______  ______  ______
 ;; /\  __-./\  __ \/\ "-.\ \/\ \/\  ___\/\ \    /\  ___\     /\  ___\/\ "-./  \/\  __ \/\  ___\/\  ___\
 ;; \ \ \/\ \ \  __ \ \ \-.  \ \ \ \  __\\ \ \___\ \___  \    \ \  __\\ \ \-./\ \ \  __ \ \ \___\ \___  \
 ;;  \ \____-\ \_\ \_\ \_\\"\_\ \_\ \_____\ \_____\/\_____\    \ \_____\ \_\ \ \_\ \_\ \_\ \_____\/\_____\
 ;;   \/____/ \/_/\/_/\/_/ \/_/\/_/\/_____/\/_____/\/_____/     \/_____/\/_/  \/_/\/_/\/_/\/_____/\/_____/


(setq debug-on-error t)

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

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/jde/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/eieio"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/elib"))

;; load cedet packages
(load-file (expand-file-name "~/.emacs.d/vendor/cedet/common/cedet.el"))

;; ensime
(require 'ensime)

;; jde
;; defer loading the JDE until a java file is opened
(setq defer-loading-jde t)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde)
  (defun screen-width nil -1)
  (define-obsolete-function-alias 'make-local-hook 'ignore "21.1")
  )

;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-jde-mode-hook ()
  (setq c-basic-offset 2))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)



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
