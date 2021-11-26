
;; Company
(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :init
  :config
  (progn
    (use-package company-statistics
      :after company
      :config
      (company-statistics-mode))
    (setq company-idle-delay 0.2
    	  company-minium-prefix-length 2
    	  company-require-match nil
    	  company-dabbrev-ignore-case nil
    	  company-dabbrev-downcase nil
    	  company-show-numbers t
	  company-selection-wrap-around t
	  company-auto-complete nil
    	  company-backends
    	  '((company-files
    	     company-keywords
	     company-capf
    	     company-yasnippet
	     )
    	    (company-abbrev company-dabbrev)
	    ))
    (setq company-global-modes
	  '(not
	    eshell-mode comint-mode erc-mode gud-mode rcirc-mode
	    minibuffer-inactive-mode org-mode))
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    ;; (define-key company-active-map (kbd "<return>") #'company-finish)
    ;; (define-key company-active-map (kbd "RET") #'company-finish)
    ;; (define-key company-active-map (kbd "C-SPC") #'company-complete-selection)
    (define-key company-active-map (kbd "RET") #'company-abort)
    (define-key company-active-map (kbd "<return>") #'company-abort)
    (define-key company-active-map (kbd "SPC") #'company-complete-selection)
    ;; (define-key company-active-map (kbd "C-SPC") #'company-complete-selection)
    (define-key company-active-map (kbd "TAB") #'company-complete-common-or-cycle)
    (define-key company-active-map (kbd "<tab>") #'company-complete-common-or-cycle)
    )
  )

(provide 'init-ac)
