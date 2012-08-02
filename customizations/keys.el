; Use shift-right arrow to move to next buffer
(global-set-key (kbd "S-s-<right>") 'next-multiframe-window)
(global-set-key (kbd "S-s-<left>") 'previous-multiframe-window)

; overload META key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; backwards word kill
(global-set-key "\C-w" 'backward-kill-word)
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
