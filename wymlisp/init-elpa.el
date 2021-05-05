;; Wymacs Package management

;; 
(require 'package)
;; (package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("melpa-stable" . "http://elpa.emacs-china.org/marmalade/")
			 ("Org" . "http://elpa.emacs-china.org/org/")
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

;; Setup `theme'
(require-package 'spacemacs-theme)

(provide 'init-elpa)
