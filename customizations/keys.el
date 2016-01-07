; Use shift-right arrow to move to next buffer
(global-set-key (kbd "C-'") 'next-multiframe-window)
(global-set-key (kbd "C-;") 'previous-multiframe-window)
(global-set-key (kbd "M-'") 'next-multiframe-window)
(global-set-key (kbd "M-;") 'previous-multiframe-window)

; paragraph navigation
(global-set-key (kbd "C-.") 'forward-paragraph)
(global-set-key (kbd "C-,") 'backward-paragraph)
(global-set-key (kbd "M-.") 'forward-paragraph)
(global-set-key (kbd "M-,") 'backward-paragraph)

; switch window splits
(global-set-key (kbd "C-x |") 'toggle-window-split)

; gotoline
(global-set-key (kbd "M-l") 'goto-line)

; multiple cursors
(global-set-key (kbd "C-<") 'mc/mark-all-like-this)

; textmate indentation shifting using meta key
(global-set-key (kbd "M-]") 'textmate-shift-right)
(global-set-key (kbd "M-[") 'textmate-shift-left)

; kill-yank for non-X11/OS X environments
(global-set-key (kbd "M-z") 'clipboard-kill-region)
(global-set-key (kbd "M-a") 'clipboard-kill-ring-save)
(global-set-key (kbd "M-q") 'clipboard-yank)

; overload META key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; projectile shortcuts
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

; comment and uncomment region
(global-set-key (kbd "s-/") 'comment-region)
(global-set-key (kbd "s-.") 'uncomment-region)

; backward remove character
(global-set-key (kbd "C-d") 'backward-delete-char)
(global-set-key (kbd "M-d") 'delete-char)

; override forward symbol
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "M-b") 'backward-word)
; word movement that is easier on a split keyboard
(global-set-key (kbd "M-d") 'forward-word)
(global-set-key (kbd "M-e") 'backward-word)

; backwards word kill
(global-set-key "\C-w" 'backward-kill-word)
;(global-set-key "\C-q" 'quoted-insert)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

; magit
(global-set-key (kbd "<f8>") 'magit-status)

(global-set-key (kbd "M-s") 'replace-string)
(global-set-key (kbd "C-M-s") 'replace-regex)

; nrepl
;;(global-set-key (kbd "<f10>") 'nrepl-jack-in)

; fullscreen!
(global-set-key [(super return)] 'ns-toggle-fullscreen)

; indent region
(global-set-key (kbd "s-]") 'indent-region)

; kill all other buffers except current
(global-set-key (kbd "<f6>") 'kill-other-buffers)

; clear textmate-mode cache
(global-set-key (kbd "<f5>") 'textmate-clear-cache)

;; indent whole buffer
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(global-set-key (kbd "C-x i") 'iwb)

; open init.el in emacs home
(global-set-key (kbd "<f7>") 'open-emacs-config)

; MODE SPECIFIC KEY BINDINGS

;; markdown mode
(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map (kbd "C-x t") 'markdown-insert-title))
