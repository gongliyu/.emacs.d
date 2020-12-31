(use-package ace-window
  :ensure t
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?l) "shortcut keys")
  :bind (("C-x o" . ace-window)))

(provide 'init-ace-window)
