;; Wyml -*- lexical-binding: t no-byte-compile: t; -*-

;; Constants
(defconst sys/linux (or (eq system-type 'gnu/linux) (eq system-type 'linux)))
(defconst sys/mac (eq system-type 'darwin))
(defconst sys/win (eq system-type 'windows-nt))
(defconst sys/cygwin (eq system-type 'cygwin))

(setq default-directory "~/")

;; Coding
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; (Menu & Tool & Scroll)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Save & Backup & Revert
(global-auto-revert-mode t)
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Tab & Indent
(setq indent-tabs-mode nil)
(setq tab-width 4)
;; (electric-indent-mode -1)

;; Yes = y, NO = n
(fset 'yes-or-no-p 'y-or-n-p)

;; Hightlight
(global-hl-line-mode t)
(setq show-paren-style 'parentheses)
(show-paren-mode t)

;; Bell & Waring
(setq ring-bell-function (lambda () (message "*beep*")))
(setq visible-bell nil)

;; Frame
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; (set-frame-position (selected-frame) 10 20)
;; (set-frame-width (selected-frame) 100)
;; (set-frame-height (selected-frame) 40)
(setq frame-title-format "emacs@%b")

;; Mouse
(global-set-key (kbd "<C-down-mouse-1>") 'nil)
(mouse-avoidance-mode 'animate)

;; 
(delete-selection-mode t)
(setq select-enable-clipboard t)
(setq default-fill-column 80)
(global-visual-line-mode t)
(setq column-number-mode t)
(setq line-number-mode t)
(setq select-enable-clipboard t)

;; Cursor
(setq-default cursor-type 'box) ;;bar, block, box

;; Startup Message
(setq inhibit-startup-message t)
(setq initial-scratch-message  "\
;; There is nothing noble in being superior to your fellow man.
;; Ture nobility is being superior to your former self.
")

;; MacOS modify option key
(cond ((string-equal system-type "darwin")
       (progn
         ;; modify option and key
         (setq mac-option-modifier 'meta))))

(provide 'init-base)
