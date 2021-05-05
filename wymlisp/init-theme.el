
(when (display-graphic-p)
  (use-package spacemacs-common
    :ensure spacemacs-theme
    :config
    (load-theme 'spacemacs-dark t)
    ;; (set-face-attribute 'fringe nil :foreground (background-color-at-point))
    ))
(provide 'init-theme)
