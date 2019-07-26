

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("3yf" "Yufeng Lin")
					    ;; Microsoft
					    ("3email" "yourslinyf@gmail.com")
					    ))


;; ---------------------------------------------------------------------

;;(set-language-environment "UTF-8")

;; turn off tool-bar-mode
(tool-bar-mode -1)

;; turn off scroll bar mode
(scroll-bar-mode -1)

;; add delete selection mode
(delete-selection-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; indent model, need two ;; to comment 
(electric-indent-mode t)

;; turn on line number
(global-linum-mode 1)

;; change the cursor type
(setq-default cursor-type 'bar)

;; change the font size
(set-face-attribute 'default nil :height 160)

;; quick open the configration file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "s-1") 'open-init-file) ;; see key bindings


;; turn off automatical backup
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

;; Recent opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;; see key bindings

(fset 'yes-or-no-p 'y-or-n-p)



(provide 'init-better-defaults)
