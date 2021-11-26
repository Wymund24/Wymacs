

(defun open-config-file ()
  (interactive)
  (find-file "~/.emacs.d/lisp/config.el"))
(global-set-key (kbd "C-c 2") 'open-config-file)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c 1") 'open-init-file)

(require 'package)
(package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("melpa-stable" . "http://elpa.emacs-china.org/marmalade/")
			 ("Org" . "http://elpa.emacs-china.org/org/")
			 ))

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'benchmark-init)
(require 'benchmark-init)
(add-hook 'after-init-hook 'benchmark-init/deactivate)

;; paren related
(require-package 'smartparens)
(require 'smartparens-config)
;; (smartparens-global-mode t)
(add-hook 'prog-mode-hook #'smartparens-mode)

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(show-paren-mode 1)

;; BG ;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(global-set-key (kbd "C-c C-f") 'find-file-at-point)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-x C-b") 'ibuffer)


(require-package 'popwin)
(require 'popwin)
(popwin-mode 1)

;; (load-theme 'monokai t)

;; (require-package 'tao-theme)
;; (load-theme 'tao-yin t)

;; mode-line
;; (setq-default mode-line-format
;;               (list '(:propertize " %l " face (:weight bold))
;;                     'mode-line-mule-info
;;                     'mode-line-modified
;;                     'mode-line-remote " "
;;                     '(:eval (propertize " %b " 'face (if (buffer-modified-p) '(:background "#d33682" :foreground "#fdf6e3" :weight bold)
;;                                                        '(:background "#268bd2" :foreground "#fdf6e3" :weight normal))))
;;                     '(:propertize " %p/%I " face (:background "gray60" :foreground "#fdf6e3")) " "
;; 		    '(:eval (propertize (format-time-string "%H:%M ")
;; 					'help-echo
;; 					(format-time-string "%F %a")
;; 					'face 'font-lock-doc-face))
;;                     '(:propertize vc-mode face (:inherit font-lock-keyword-face :weight bold))
;;                     " {%m} " "-%-"))



(global-set-key (kbd "C-c b l") 'list-bookmark)
(global-set-key (kbd "C-c b s") 'bookmark-set)


;; (require-package 'magit)
;; (global-set-key (kbd "C-x g") 'magit-status)


;;--8here--;;

(provide 'config)
