
(use-package window-numbering
  :config
  (window-numbering-mode 1))

(defhydra hydra-window-resize (:color pink :hint nil)
"
^Window Size^
^-----------^
^ ^ _k_ ^ ^
_h_ ^+^ _l_
^ ^ _j_ ^ ^
_b_alance^^^^
"
  ("q" nil "quit" :color blue)
  ("b" balance-windows)
  ("h" shrink-window-horizontally)
  ("k" shrink-window)
  ("j" enlarge-window)
  ("l" enlarge-window-horizontally))

(define-key global-map (kbd "C-c w") 'hydra-window-resize/body)

(provide 'init-windows)
