
;; Parens Plugin
(use-package avy)
(use-package smartparens
  :diminish smartparens-mode
  :config
  (progn
    (smartparens-global-mode t)
    (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
    (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(provide 'init-edit)
