(use-package org
  :after (ace-link)
  :mode (("\\.org\\'" . org-mode))
  :bind
  (("C-c l" . 'org-store-link)
   ("C-c a" . 'org-agenda)
   ("C-c c" . 'org-capture)
   ("C-c b" . 'org-switchb)
   (:map org-mode-map
         ("M-o" . 'ace-link-org)))
  :config
  (setq org-agenda-files '("~/personal/plan.org" "~/personal/notes.org"))
  (setq org-default-notes-file "~/personal/notes.org")
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3))))
                             
(provide 'init-org)
