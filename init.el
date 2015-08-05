
 ;;  _____   ______  __   __  __  ______  __      ______       ______  __    __  ______  ______  ______
 ;; /\  __-./\  __ \/\ "-.\ \/\ \/\  ___\/\ \    /\  ___\     /\  ___\/\ "-./  \/\  __ \/\  ___\/\  ___\
 ;; \ \ \/\ \ \  __ \ \ \-.  \ \ \ \  __\\ \ \___\ \___  \    \ \  __\\ \ \-./\ \ \  __ \ \ \___\ \___  \
 ;;  \ \____-\ \_\ \_\ \_\\"\_\ \_\ \_____\ \_____\/\_____\    \ \_____\ \_\ \ \_\ \_\ \_\ \_____\/\_____\
 ;;   \/____/ \/_/\/_/\/_/ \/_/\/_/\/_____/\/_____/\/_____/     \/_____/\/_/  \/_/\/_/\/_/\/_____/\/_____/


;; common lisp support
(require 'cl)

;; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/ensime_2.9.1-0.7.6/elisp/")
(add-to-list 'load-path "~/.emacs.d/vendor/malabar-1.5/lisp")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/jde/lisp"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/eieio"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/elib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/molokai"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scala-mode2"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/textmate"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/textmate"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/multiple-cursors"))
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/noctilux-theme")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/anti-zenburn")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/hipster-theme")
;; ;; autocomplete
;; (add-to-list 'load-path "~/.emacs.d/vendor")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/ac-dict")
;; (ac-config-default)
;; (require 'go-autocomplete)
;; (require 'auto-complete-config)

(load "~/.emacs.d/customizations/functions")
;; load path and exec-path from system $PATH
(set-exec-path-from-shell-PATH)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;; lod rbenv from path
(set-rbenv-path)

;; load rsense
;(setq rsense-home "~/bin/rsense-0.3")
;(add-to-list 'load-path (concat rsense-home "/etc"))
;(require 'rsense)

;; yaml mode
;;(load-file (expand-file-name "~/.emacs.d/elpa/yaml-mode-0.0.7/yaml-mode.el"))
;;(require 'yaml-mode)

;; load cedet packages
;;(load-file (expand-file-name "~/.emacs.d/vendor/cedet/common/cedet.el"))
;;(semantic-load-enable-minimum-features) ;; or enable more if you wish
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/vendor/malabar-1.5/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; textmate mode
(require 'textmate)
(textmate-mode)

;; ensime
(require 'ensime)

;; scala-mode
;;(require 'scala-mode2)

;; multiple cursors
;;(load-file (expand-file-name "~/.emacs.d/vendor/multiple-cursors/multiple-cursors.el"))
;;(require 'multiple-cursors)

;; packages
(require 'package)
(package-initialize)

;; add package sources
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(load "~/.emacs.d/prelude-packages")

;; use projectile mode globally
(projectile-global-mode)

(load "~/.emacs.d/customizations/ensime")
(load "~/.emacs.d/customizations/keys")
(load "~/.emacs.d/customizations/editing")
(load "~/.emacs.d/customizations/theme")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("01d8c9140c20e459dcc18addb6faebd7803f7d6c46d626c7966d3f18284c4502" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "3539b3cc5cbba41609117830a79f71309a89782f23c740d4a5b569935f9b7726" "d72836155cd3b3e52fd86a9164120d597cbe12a67609ab90effa54710b2ac53b" "5d8caed7f4ed8929fd79e863de3a38fbb1aaa222970b551edfd2e84552fec020" "113ae6902d98261317b5507e55ac6e7758af81fc4660c34130490252640224a2" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "ee17bcdaa3ce2c5b287dff4d4c1da13f45bfa2f1aa9e11ff0bbbebb2e6be79c5" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "2a366939c7ae86b622f8d28d2d58c89f7a83d4d80cc945bc2f92ba48d7bac3ea" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "e74d80bf86c7951b1a27994faa417f7e3b4a02f7a365ed224f032bd29f5d2d6d" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "49eea2857afb24808915643b1b5bd093eefb35424c758f502e98a03d0d3df4b1" "a1493957ee779057acdc4c337133f217dd7b2edfdeeffed903ba2f16246f665a" "5bd5af0deb1ab0e2c1b9c54d94a3f030529b6c7034fdf0d3cc4b0e7e0338cb91" "30fe7e72186c728bd7c3e1b8d67bc10b846119c45a0f35c972ed427c45bacc19" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(vc-annotate-background "#586e75")
 '(vc-annotate-color-map
   (quote
    ((20 . "#990A1B")
     (40 . "#FF6E64")
     (60 . "#cb4b16")
     (80 . "#7B6000")
     (100 . "#b58900")
     (120 . "#DEB542")
     (140 . "#546E00")
     (160 . "#859900")
     (180 . "#B4C342")
     (200 . "#3F4D91")
     (220 . "#6c71c4")
     (240 . "#9EA0E5")
     (260 . "#2aa198")
     (280 . "#69CABF")
     (300 . "#00629D")
     (320 . "#268bd2")
     (340 . "#69B7F0")
     (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#93115C"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "#559944"))))
 '(diff-context ((t nil)))
 '(diff-file-header ((((class color) (min-colors 88) (background dark)) (:foreground "RoyalBlue1"))))
 '(diff-function ((t (:foreground "#00bbdd"))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:foreground "RoyalBlue1"))))
 '(diff-hunk-header ((t (:foreground "#fbde2d"))))
 '(diff-nonexistent ((t (:inherit diff-file-header :strike-through nil))))
 '(diff-refine-change ((((class color) (min-colors 88) (background dark)) (:background "#182042"))))
 '(diff-removed ((t (:foreground "#de1923"))))
 '(flymake-errline ((t :underline "red")) t)
 '(flymake-warnline ((t :underline "green")) t))

;;(load-file "~/.emacs.d/elpa/magit-1.2.0/magit.el")
(put 'dired-find-alternate-file 'disabled nil)
