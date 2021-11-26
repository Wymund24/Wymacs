
(use-package dired
  :ensure nil
  :config
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (put 'dired-find-alternate-file 'disabled nil)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "C-c C-o") 'wyml:open-in-external-app)

  (use-package dired-x
    :ensure nil
    :config
    (setq dired-dwin-target t))

  (use-package diredfl
    :after dired
    :init (diredfl-global-mode 1))
  )

(provide 'init-dired)
