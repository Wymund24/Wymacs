
;; {{ Mode-line
;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html

(defun buffer-encoding-abbrev ()
  "The line ending convention used in the buffer."
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
	(match-string 1 buf-coding)
      buf-coding)))

;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
	      (list
	       ;; window numbering
	       '(:eval (window-numbering-get-number-string))
	       " "

	       ;; the buffer name; the file name as a tool tip
	       '(:eval (propertize "%b " 'face 'font-lock-keyword-face
				   'help-echo (buffer-file-name)))

	       ;; line and column
	       "(" ;; '%02' to set to 2 chars at least; prevents flickering
	       (propertize "%02l" 'face 'font-lock-type-face) ","
	       (propertize "%02c" 'face 'font-lock-type-face) 
	       ") "

	       ;; relative position, size of file
	       "["
	       (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
	       "/"
	       (propertize "%I" 'face 'font-lock-constant-face) ;; size
	       "]"

	       ;; evil states
	       '(:eval evil-mode-line-tag)

	       ;; the current major mode for the buffer.
	       "["
	       '(:eval (propertize "%m" 'face 'font-lock-string-face
				   'help-echo buffer-file-coding-system))
	       "] "

	       ;; buffer coding
	       "("
	       '(:eval (buffer-encoding-abbrev))
	       ") "

	       "[" ;; insert vs overwrite mode, input-method in a tooltip
	       '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
				   'face 'font-lock-preprocessor-face
				   'help-echo (concat "Buffer is in "
						      (if overwrite-mode "overwrite" "insert") " mode")))

	       ;; was this buffer modified since the last save?
	       '(:eval (when (buffer-modified-p)
			 (concat ","  (propertize "Mod"
						  'face 'font-lock-warning-face
						  'help-echo "Buffer has been modified"))))

	       ;; is this buffer read-only?
	       '(:eval (when buffer-read-only
			 (concat ","  (propertize "RO"
						  'face 'font-lock-type-face
						  'help-echo "Buffer is read-only"))))  
	       "] "

	       ;; add the time, with the date and the emacs uptime in the tooltip
	       '(:eval (propertize (format-time-string "%H:%M")
				   'help-echo
				   (concat (format-time-string "%c; ")
					   (emacs-uptime "Uptime:%hh"))))
	       " --"
	       ;; i don't want to see minor-modes; but if you want, uncomment this:
	       ;; minor-mode-alist  ;; list of minor modes
	       "%-" ;; fill with '-'
	       ))

;; mode-line END }}


(provide 'init-modeline)
