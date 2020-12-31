(setq c-basic-offset 4) ; set indent to 4 charcter
(setq c-default-style "stroustrup")
(c-set-offset 'inline-open '0)

;; (use-package irony
;;   :ensure
;;   :config
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; (use-package company-irony
;;   :ensure
;;   :after (:all irony company)
;;   :config
;;   (add-to-list 'company-backends 'company-irony))

;;(use-package cmake-ide :ensure :config (require 'subr-x) (cmake-ide-setup))

(use-package cmake-mode
  :ensure
  :ensure cmake-font-lock
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(provide 'init-cpp)
