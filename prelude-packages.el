(defvar prelude-packages
  '(ack-and-a-half clojure-mode coffee-mode expand-region gist haml-mode
		   inf-ruby magit magithub markdown-mode paredit python
		   ruby-mode sass-mode scss-mode smart-tab
		   solarized-theme volatile-highlights yaml-mode yari zenburn-theme
		   php-mode nrepl haskell-mode clojurescript-mode
		   rspec-mode ruby-electric auto-complete less-css-mode go-mode)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'prelude-packages)
