; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode 1)

; show clock in status bar
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; use autopair
;;(add-to-list 'load-path "~/.emacs.d/vendor/autopair") ;; comment if autopair.el is in standard load path
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers

(require 'auto-complete)

; yes, I want to kill buffers with processes attached
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; start robe mode with ruby
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(global-company-mode t)
(push 'company-robe company-backends)

; use ibuffer instead
(defalias 'list-buffers 'ibuffer)

; use shift-select-mode
(setq shift-select-mode t)

; use cua mode
(cua-mode t)

; use autopair
(add-to-list 'load-path "~/.emacs.d/vendor/autopair") ;; comment if autopair.el is in standard load path
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

(add-hook 'ruby-mode-hook '(lambda ()
                               ;; make ruby-electric play nice with autopair
                               (substitute-key-definition 'ruby-electric-curlies nil ruby-mode-map)
                               (substitute-key-definition 'ruby-electric-matching-char nil ruby-mode-map)
                               (substitute-key-definition 'ruby-electric-close-matching-char nil ruby-mode-map)))


; ruby-electric mode for ruby-mode
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
; ruby 1.9 hash syntax highlighting
(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))

;; call 'gofmt' on save
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/daniel/Development/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; ;; Complete by C-c .
;; (add-hook 'ruby-mode-hook
;;       (lambda ()
;; 	(local-set-key (kbd "C-c .") 'ac-complete-rsense)))

; prevent scss compile-on-save
(setq scss-compile-at-save nil)

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; tabs and indentation

(setq c-basic-indent 2)
(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)

; line spacing
(setq-default line-spacing 5)

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
(setq magit-push-always-verify nil)

;; markdown mode hook
(defun set-markdown-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.md\\'" buffer-file-name))
    (markdown-mode)))

(add-hook 'find-file-hook 'set-markdown-mode)

;; scss mode customizations
;; Hide *compilation* buffer if compile didn't give erros
(defadvice compilation-start (before aj-compilation-save-window-configuration(command comint))
  "Save window configuration before compilation in
`aj-compilation-saved-window-configuration'"

  ;; compile command is not saved in compilation-start function only in
  ;; compile function (rgrep only uses compilation-start)
  (setq aj-compile-command command)
  ;; Save window configuration
  (setq aj-compilation-saved-window-configuration
        (current-window-configuration)))
(ad-activate 'compilation-start)
