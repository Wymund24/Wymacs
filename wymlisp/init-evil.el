

(use-package evil
  :config
  (progn
    (evil-mode 1)
    (setcdr evil-insert-state-map nil)
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    (setq-default evil-auto-indent nil)
    (setq evil-move-cursor-back nil)
    (setq evil-emacs-state-cursor '("#FF5050" box))
    (setq evil-motion-state-cursor '("yellow" box))
    (setq evil-normal-state-cursor '("#E3DEDD" box)) ;; #E0E0E0 #E3DEDD
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("#FF5050" bar))
    (setq evil-replace-state-cursor '("#FF5050" hbar))
    (setq evil-operator-state-cursor '("#FF5050" hollow))

    ;; Made some modes to use emacs-state
    (dolist (mode '(
		    ;; dired-mode
		    ;; Message-mode
		    ))
      (add-to-list 'evil-emacs-state-modes mode))
    (with-current-buffer "*Messages*"
      (evil-emacs-state))
    ))

(use-package evil-leader
  :after evil
  :config
  (progn
    (global-evil-leader-mode t)
    (evil-leader/set-leader "<SPC>")))

(use-package evil-escape
  :diminish evil-escape-mode
  :after evil
  :config
  (progn
    (setq-default evil-escape-key-sequence "kj")
    (setq-default evil-escape-delay 0.2)
    (evil-escape-mode 1)
    (global-set-key (kbd "C-c C-g") 'evil-escape)
    ))



(provide 'init-evil)
