;; Wymacs Package management

;; 
(require 'package)
;; (package-initialize)

(setq package-archives '(

			 ;; ("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ;; ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ;; ("melpa-stable" . "http://elpa.emacs-china.org/marmalade/")
			 ;; ("Org" . "http://elpa.emacs-china.org/org/")

			 ("gnu" . "https://mirrors.163.com/elpa/gnu/")
			 ("melpa" . "https://mirrors.163.com/elpa/melpa/")
			 ("melpa-stable" . "https://mirrors.163.com/elpa/melpa-stable/")
			 ))

;; (package-initialize)

;; HACK: DO NOT copy package-selected-packages to init/custom file forcibly.
;; https://github.com/jwiegley/use-package/issues/383#issuecomment-247801751
(defun wyml/save-selected-packages (&optional value)
  "Set `package-selected-packages' to VALUE but don't save to `custom-file'."
  (when value
    (setq package-selected-packages value)))
(advice-add 'package--save-selected-packages :override #'wyml/save-selected-packages)

(defun require-package (package &optional min-version no-refresh)
  (cond
   ((package-installed-p package min-version)
    t)
   ((or (assoc package package-archive-contents) no-refresh)
    (package-install package))
   (t
    (package-refresh-contents)
    (require-package package min-version t))))

;;--Package List--;;

;; Setup `use-package'
(require-package 'use-package)
(require-package 'diminish) ;; if you use :diminish
(require-package 'bind-key) ;; if you use any :bind variant

;; Setup `Features'
(require-package 'avy)
(require-package 'ivy)
(require-package 'company)
(require-package 'company-statistics)
(require-package 'which-key)
(require-package 'window-numbering)
(require-package 'counsel)
(require-package 'swiper)
(require-package 'smex)
(require-package 'smartparens)
(require-package 'rainbow-delimiters)
(require-package 'diredfl)
(require-package 'hydra)

;; Setup `theme'
(require-package 'spacemacs-theme)

;; Setup `Text'
(require-package 'markdown-mode)

;; Setup `Evil'
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-escape)

(provide 'init-elpa)
