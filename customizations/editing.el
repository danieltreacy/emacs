; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode 1)

; yes, I want to kill buffers with processes attached
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

; use ibuffer instead
(defalias 'list-buffers 'ibuffer)

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; tabs and indentation
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)

; whitespace
;(global-whitespace-mode t)
;(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; show column number in bar
(column-number-mode t)

; highlight URLs in comments/strings
(add-hook 'find-file-hooks 'goto-address-prog-mode)

; selection
(delete-selection-mode t)

; highlight matching parens
(show-paren-mode t)

; wrap lines in a tasteful way
(global-visual-line-mode 1)

; Make yes-or-no questions answerable with 'y' or 'n'
(fset 'yes-or-no-p 'y-or-n-p)

; delete files by moving them to the OS X trash
(setq delete-by-moving-to-trash t)

; don't display startup message
(setq initial-buffer-choice "~/.emacs.d/startup.txt")

; no scrollbar
(scroll-bar-mode -1)

; no toolbar
(tool-bar-mode -1)

; blink cursor
(blink-cursor-mode t)

; highlight current line
(global-hl-line-mode nil)

; force new frames into existing window
(setq ns-pop-up-frames nil)

; no bell
(setq ring-bell-function 'ignore)

; smooth scrolling
(setq scroll-conservatively 10000
  scroll-step 1)

; smart-tab
(require 'smart-tab)
(global-smart-tab-mode 1)
(setq smart-tab-using-hippie-expand nil)
(setq smart-tab-completion-functions-alist
  '((emacs-lisp-mode . lisp-complete-symbol)
    (text-mode . dabbrev-completion)
    (clojure-mode . slime-complete-symbol)))

;; disable backing up files
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; magit stuff
(autoload 'magit-status "magit" nil t)

;; markdown mode hook
(defun set-markdown-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.md\\'" buffer-file-name))
    (markdown-mode)))

(add-hook 'find-file-hook 'set-markdown-mode)
