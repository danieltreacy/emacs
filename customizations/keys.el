; Use shift-right arrow to move to next buffer
(global-set-key (kbd "C-'") 'next-multiframe-window)
(global-set-key (kbd "C-;") 'previous-multiframe-window)

; paragraph navigation
(global-set-key (kbd "C-.") 'forward-paragraph)
(global-set-key (kbd "C-,") 'backward-paragraph)

; overload META key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; backward remove character
(global-set-key (kbd "C-l") 'backward-delete-char-untabify)

; backwards word kill
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-q" 'kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

; magit
(global-set-key (kbd "<f8>") 'magit-status)

; fullscreen!
(global-set-key [(super return)] 'ns-toggle-fullscreen)

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
