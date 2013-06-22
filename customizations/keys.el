; Use shift-right arrow to move to next buffer
(global-set-key (kbd "C-'") 'next-multiframe-window)
(global-set-key (kbd "C-;") 'previous-multiframe-window)

; paragraph navigation
(global-set-key (kbd "C-.") 'forward-paragraph)
(global-set-key (kbd "C-,") 'backward-paragraph)

; overload META key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; comment and uncomment region
(global-set-key (kbd "s-/") 'comment-region)
(global-set-key (kbd "s-.") 'uncomment-region)

; backward remove character
(global-set-key (kbd "C-d") 'backward-delete-char)
(global-set-key (kbd "M-d") 'delete-char)

; override forward symbol
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "M-b") 'backward-word)

; backwards word kill
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-q" 'kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

; magit
(global-set-key (kbd "<f8>") 'magit-status)

; nrepl
(global-set-key (kbd "<f10>") 'nrepl-jack-in)

; fullscreen!
(global-set-key [(super return)] 'ns-toggle-fullscreen)

; indent region
(global-set-key (kbd "s-]") 'indent-region)

; rename buffer
(global-set-key (kbd "<f6>") 'rename-buffer)


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
