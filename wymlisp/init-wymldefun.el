;; Unix, Mac: CR ; Win: CRLF
(defun wyml:save-file-coding-unix ()
  "save file with coding unix(utf-8-unix)"
  (interactive)
  (set-buffer-file-coding-system 'unix 't)
  (save-buffer))

(defun wyml:open-file-folder ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))
(provide 'init-wymldefun)

;; http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html
(defun wyml:open-in-external-app ()
  "open file in exteranl app in dired mode."
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
	      (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
		       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       (sys/win
	;; (string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" $fpath t t))) $file-list))
       (sys/mac
	;; (string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath)))) $file-list))
       (sys/linux
	;; (string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

(defun wyml:close-all-buffers ()
  "close all buffers"
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
