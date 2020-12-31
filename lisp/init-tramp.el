(if (eq system-type 'windows-nt)
    (setq tramp-default-method "pscp")
  (setq tramp-default-method "scp"))
(setq remote-file-name-inhibit-cache nil)
(setq tramp-completion-reread-directory-timeout nil)
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq password-cache-expiry nil)        ;cache password for tramp

(use-package counsel-tramp
  :ensure t
  :bind ("C-c s" . counsel-tramp)
  )

(provide 'init-tramp)
