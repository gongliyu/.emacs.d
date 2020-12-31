(defun liyu-font-exists-p (font)
  (if (null (x-list-fonts font))
      nil t))

;; set liyu-font-candidates somewhere first
;; e.g. (setq liyu-font-candidates '("Consolas 13", "Consolas 15"))
(when (and window-system liyu-font-candidates (listp liyu-font-candidates))
  (let ((fonts liyu-font-candidates)
        (font-found)
        (x))
    (while (and fonts (not font-found))
      (setq x (pop fonts))
      (setq font-found (liyu-font-exists-p x))
      (when font-found
        (add-to-list 'default-frame-alist (cons 'font x) t)))))

(provide 'init-fonts)
