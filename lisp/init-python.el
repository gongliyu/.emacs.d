(defun liyu-python-send-block-to-shell-and-step ()
  "send a block to shell and step forward one block"
  (interactive)
  (beginning-of-line)
  (let ((beg (point))
        (end (point)))

    (while
        (progn
          ;; navigate to then end of block
          (python-nav-end-of-statement)
          (python-nav-end-of-block)
          (setq end (point))
          ;; navigate to the beginning of next statement
          (python-nav-forward-statement)
           ;; until next statement is not `else` or `elif`
          (string-match-p
           "\\(^else[[:blank:]]*:\\)\\|\\(^elif[[:blank:]]+.+:\\)"
           (buffer-substring-no-properties (point) (line-end-position)))))
    (when (not (equal beg end))
      (python-shell-send-region beg end))))

;; (use-package anaconda-mode
;;   :ensure t
;;   ;; :diminish anaconda-mode
;;   :bind (:map python-mode-map
;;               ("<C-return>" . 'liyu-python-send-block-to-shell-and-step))
;;   :hook
;;   (python-mode)
;;   (python-mode . anaconda-eldoc-mode)
;;   ;; :init
;;   ;; (progn
;;   ;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   ;;   (add-hook 'python-mode-hook 'eldoc-mode))
;;   :config
;;   (setq python-shell-interpreter "ipython"
;;         python-shell-interpreter-args "-i --simple-prompt"))

;; (use-package company-anaconda
;;   :ensure t
;;   :init (add-to-list 'company-backends 'company-anaconda))

;; (use-package ein
;;   :ensure t)

;; (use-package lsp-python-ms
;;   :ensure t
;;   :demand
;;   :hook (python-mode . lsp)
;;   :hook (python-mode . (lambda ()
;;                          (local-set-key (kbd "<C-return>") 'liyu-python-send-block-to-shell-and-step)))
;;   ;; :bind (:map python-mode-map
;;   ;;             ("<C-return>" . 'liyu-python-send-block-to-shell-and-step))
  
;;   :config
;;   (setq python-shell-interpreter "ipython"
;;         python-shell-interpreter-args "-i --simple-prompt"))


(use-package python
  :hook (python-mode . lsp)
  :bind (:map python-mode-map ("<C-return>" . 'liyu-python-send-block-to-shell-and-step))
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))

;; use conda env
(use-package conda :ensure t)

(provide 'init-python)
