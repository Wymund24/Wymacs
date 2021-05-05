;; Wymund Emacs configuration

(setq emacs-load-start-time (current-time))

(push (expand-file-name "wymlisp" user-emacs-directory) load-path)
(push (expand-file-name "site-lisp" user-emacs-directory) load-path)

(let* ((file-name-handler-alist nil))
  ;; 
  (require 'init-basic)
  (require 'init-font)
  (require 'init-elpa)  ;; Package management
  (require 'init-theme) ;; Setup theme
  (require 'init-text)  ;; text, org, markdown etc.
  )

(setq custom-file (expand-file-name "~/.emacs.d/wymlisp/init-custom.el"))
(load-file custom-file)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
	   (time-to-seconds (time-since emacs-load-start-time))))
