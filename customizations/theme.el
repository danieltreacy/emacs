; nice font
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Input Mono Condensed 13"))

; fontify current frame
(fontify-frame nil)

; fontify any future frames
(push 'fontify-frame after-make-frame-functions)

;(require 'color-theme)

;(color-theme-clarity)
;(load-file "~/.emacs.d/vendor/molokai/molokai.el")
;(color-theme-molokai)

;(load-file "~/.emacs.d/vendor/color-theme-github/color-theme-github.el")

;(color-theme-github)

;(load-theme 'zenburn t)

;(color-theme-charcoal-black)

(load-theme 'solarized-light t)

;(color-theme-sons-of-obsidian)

;(load-file "~/.emacs.d/vendor/tomorrow-theme/color-theme-tomorrow.el")
;(color-theme-tomorrow-night)

;(load-file "~/.emacs.d/vendor/pastels-on-dark-theme/pastels-on-dark-theme.el")
;(load-theme 'pastels-on-dark t)

;(load-theme 'dakrone t)

;(load-file "~/.emacs.d/vendor/subtle-hacker-theme/subtle-hacker-theme.el")
;(load-theme 'subtle-hacker)

;(load-file "~/.emacs.d/elpa/color-theme-heroku-1.0.0/color-theme-heroku.el")

;(color-theme-heroku)

;; sundry colors taken from https://github.com/al3x/emacs
;; thanks alex

; colors
(custom-set-faces
 '(flymake-errline ((t :underline "red")))
 '(flymake-warnline ((t :underline "green"))))

; pretty diff-mode
(custom-set-faces
 '(diff-added ((t (:foreground "#559944"))))
 '(diff-context ((t nil)))
 '(diff-file-header ((((class color) (min-colors 88) (background dark)) (:foreground "RoyalBlue1"))))
 '(diff-function ((t (:foreground "#00bbdd"))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:foreground "RoyalBlue1"))))
 '(diff-hunk-header ((t (:foreground "#fbde2d"))))
 '(diff-nonexistent ((t (:inherit diff-file-header :strike-through nil))))
 '(diff-refine-change ((((class color) (min-colors 88) (background dark)) (:background "#182042"))))
 '(diff-removed ((t (:foreground "#de1923")))))

; pretty magit diffs (based on colors for diff-mode above)
;(set-face-attribute 'magit-diff-add nil :foreground "#559944")
;(set-face-attribute 'magit-diff-del nil :foreground "#de1923")
;(set-face-attribute 'magit-diff-file-header nil :foreground "RoyalBlue1")
;(set-face-attribute 'magit-diff-hunk-header nil :foreground "#fbde2d")
;(set-face-attribute 'magit-item-highlight nil :background "black")
