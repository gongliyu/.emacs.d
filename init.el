;; -*- coding: utf-8 -*-
(setq debug-on-error t)

;;************************************************************
;; global setting
;;************************************************************
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq machine-specific-pre-file
      (expand-file-name "machine-specific-pre.el" user-emacs-directory))
(setq machine-specific-post-file
      (expand-file-name "machine-specific-post.el" user-emacs-directory))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(defvar liyu-font-candidates '("Consolas 13" "Menlo 13" "Mono 13") "list of candidate fonts.")
(defvar liyu-frame-width 80 "Frame width")
(defvar liyu-frame-height 30 "Frame height")

;;************************************************************
;; package manager system
;;************************************************************
;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;************************************************************
;; load machine-specific-pre settings
;;************************************************************
(when (file-exists-p machine-specific-pre-file)
  (load machine-specific-pre-file))

;;************************************************************
;; basic UI and apperance
;;************************************************************
(setq inhibit-startup-screen t)
(setq default-directory "~/") ; default path to open a file
(tool-bar-mode 0) ; disable toolbars
(setq-default indent-tabs-mode nil) ;; use space for indent instead of tab

(require 'init-fonts) ; fonts
(if (or (<= liyu-frame-width 0) (<= liyu-frame-height 0))
    (set-frame-parameter nil 'fullscreen 'fullboth)
  (add-to-list 'default-frame-alist '(width . liyu-frame-width))
  (add-to-list 'default-frame-alist '(height . liyu-frame-height)))

(when (eq system-type 'windows-nt)
  (prefer-coding-system 'chinese-gbk)
  (prefer-coding-system 'utf-8))

(global-font-lock-mode 1)

(setq make-backup-files nil) ; do not save backup files
(setq backup-by-copying-when-linked t)
(setq delete-auto-save-files t) ; delete auto-save file when quit

(use-package server :config (unless (server-running-p) (server-start)))

(setq bookmark-save-flag 1) ;; save bookmark automatically

(setq vc-follow-symlinks t)

;; set windows gs-program for Doc-View mode
(when (eq window-system 'windows-nt) (setq doc-view-ghostscript-program "gswin32c"))

;; ispell
(if (eq system-type 'windows-nt)
  (progn
    (setq-default ispell-program-name "hunspell")
    (setq-default ispell-local-dictionary "en_US")
    (setq ispell-local-dictionary-alist
          '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
    )
  (setq-default ispell-program-name "aspell")
  (setq-default ispell-local-dictionary "american")
  )

;; view nfo file
(modify-coding-system-alist 'file "\\.nfo\\'" 'cp437)

;; yaml
(use-package yaml-mode
  :ensure t
  :mode "\\.yaml\\'")

;; rst
(use-package rst
  :config
  (setq rst-indent-width 4))

;; theme
(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package unfill :ensure t)

(require 'init-company)
(require 'init-tramp)
(require 'init-ace-window)
(require 'init-ace-link)
(require 'init-dired)
(require 'init-lsp)
(require 'init-org)
(require 'init-markdown)
(require 'init-latex)
(require 'init-ivy)
(require 'init-python)
(require 'init-cpp)
(require 'init-ess)



(when (file-exists-p machine-specific-post-file)
  (load machine-specific-post-file))
(when (file-exists-p custom-file) (load custom-file))
