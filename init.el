;; Stuff taken from https://github.com/purcell/emacs.d

;; Produce backtraces when errors occur
(setq debug-on-error t)

(let ((minver "24.4"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "25.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; from https://raw.githubusercontent.com/renormalist/emacs-pod-mode/master/pod-mode.el
(require 'pod-mode)
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-hook 'pod-mode-hook 'font-lock-mode)

;; install markdown-mode manually using https://jblevins.org/projects/markdown-mode/

(load-theme 'sanityinc-tomorrow-bright t)
;; (load-theme 'distinguished t)
;; (load-theme 'manoj-dark t)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'darktooth t)
;; (load-theme 'soothe t)
;; (load-theme 'darkburn t)
;; (load-theme 'darkmine t)
;; (load-theme 'dark-mint t)
;; (load-theme 'wheatgrass t)
;; (load-theme 'alect-black-alt t)
;; (load-theme 'alect-black t)
;; (load-theme 'bubbleberry t)
;; (load-theme 'zenburn t)
;; (load-theme 'badger t)
;; (load-theme 'afternoon t)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'dracula t)
;; (load-theme 'dark-krystal t)

(require 'auctex-latexmk)
(auctex-latexmk-setup)
(add-hook 'LaTeX-mode-hook #'visual-line-mode)

;;; show TOC (document structure) with C-c =
;;; from https://tex.stackexchange.com/a/245250
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(setq reftex-plug-into-AUCTeX t) 

(global-set-key (kbd "C-x g") 'magit-status)
(add-hook 'magit-mode-hook 'visual-line-mode)

(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(package-selected-packages
   (quote
    (markdown-mode company magit distinguished-theme spacemacs-theme darktooth-theme darkmine-theme dark-mint-theme dark-krystal-theme darcula-theme cyberpunk-theme alect-themes bubbleberry-theme color-theme-sanityinc-solarized color-theme-solarized color-theme-sanityinc-tomorrow afternoon-theme darkburn-theme soothe-theme badger-theme zenburn-theme auctex-latexmk auctex dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 181 :width normal)))))
