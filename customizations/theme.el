; nice font
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Deja-Vu-Sans-Mono-12"))

; fontify current frame
(fontify-frame nil)

; fontify any future frames
(push 'fontify-frame after-make-frame-functions)

(require 'color-theme)

(color-theme-charcoal-black)

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
