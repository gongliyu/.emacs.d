(use-package ess
  :ensure t
  :init
  (add-hook 'ess-pre-run-hook (lambda () (setq ess-directory "~/")))
  (add-hook 'ess-mode-hook (lambda () (ess-toggle-underscore nil)))
  ;;(add-hook 'inferior-ess-mode-hook (lambda () (ess-toggle-underscore nil)))
  :config
  (setq ess-default-style 'RStudio)
  )

(provide 'init-ess)
