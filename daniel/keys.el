; Use shift-right arrow to move to next buffer
(global-set-key (kbd "S-s-<right>") 'next-multiframe-window)
(global-set-key (kbd "S-s-<left>") 'previous-multiframe-window)

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
