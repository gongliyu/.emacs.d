(setq dired-listing-switches "-lh")
(setq delete-by-moving-to-trash t)
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode 1)
            (when (memq system-type '(windows-nt ms-dos cygwin))
              (setq dired-omit-files
                    (concat dired-omit-files "\\|^System Volume Information$")))
            (when (eq system-type 'windows-nt)
              (setq dired-guess-shell-alist-user
                    (list
                     (list "\\.[pP][dD][fF]$" "Acrobat.exe" "AcroRd32.exe")
                     )))) t)

(setq dired-recursive-deletes t) ;; recursive deletion
(setq dired-recursive-copies t) ;; recursive copying

;; edit dired buffer
(require 'wdired)
(autoload 'wdired-change-to-wdired-mode "wdired")
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(provide 'init-dired)
