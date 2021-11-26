
(use-package ivy
  :diminish ivy-mode
  :config
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (ivy-mode 1)
    ))

;; https://emacs-china.org/t/ivy-mode/147
(use-package smex)

(use-package counsel
  :bind
  (("C-x C-f" . 'counsel-find-file)
   ("M-x" . 'counsel-M-x)
   ))

(use-package swiper
  :bind
  (("C-s" . 'swiper)))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

(provide 'init-ivy)
