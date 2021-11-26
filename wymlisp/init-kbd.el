;; Global set key
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Leader Key
(evil-leader/set-key

  "ff" 'counsel-find-file
  "fp" 'find-file-at-point
  "x" 'counsel-M-x
  ";" 'counsel-M-x
  "gk" 'avy-goto-char
  "gl" 'avy-goto-line
  "ca" 'org-capture
  "bi" 'ibuffer
  "bb" 'switch-to-buffer
  "ko" 'kill-buffer
  ;;Windows navy
  "w" 'other-window
  "0" 'delete-window
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  "6" 'select-window-6
  "7" 'select-window-7
  "8" 'select-window-8
  "9" 'select-window-9

  )

(provide 'init-kbd)
