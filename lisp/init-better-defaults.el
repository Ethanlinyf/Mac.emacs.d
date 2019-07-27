

;; ---------------------------------------------------------------------

;;(set-language-environment "UTF-8")

;; automatically update the files when they are changed outside
(global-auto-revert-mode 1)


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
  (find-file "~/.emacs.d/EthanLinyfEmacs.org"))
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

;; indent

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)



(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

(global-set-key (kbd "s-/") 'hippie-expand)

;; Dird mode operation

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;;(require 'dired)
;;(defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwin-target 1)



(provide 'init-better-defaults)
