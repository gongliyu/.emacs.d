(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook (lambda() (TeX-fold-mode 1)))

(use-package company-auctex
  :ensure
  :hook (LaTeX-mode . company-auctex-init))
  

(provide 'init-latex)
