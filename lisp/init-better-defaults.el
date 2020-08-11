;;; init-abbrev.el --- Better default configurations.	-*- lexical-binding: t -*-

;;; Copyright (C) 2019

;; Author: Teamwork  <e.yflin@gmail.com>
;; URL: https://github.com/Ethanlinyf/Mac.emacs.d

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version, such as GPLv3
;; (URL: https://www.gnu.org/licenses/gpl-3.0.en.html).
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;;; Commentary:
;;
;;
;;; Code:



;;(set-language-environment "UTF-8")
(setq-default fill-column 80)

;; automatically update the files when they are changed outside
(global-auto-revert-mode 1)

;; set visual line mode
;;(global-visual-line-mode 1) ; 1 for on, 0 for off.

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

(defun open-planning-file()
  (interactive)
  (find-file "~/.emacs.d/Mac.emacs.d_GTD.org"))
(global-set-key (kbd "s-1") 'open-planning-file) ;; see key bindings

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/org-init.org"))
(global-set-key (kbd "s-2") 'open-init-file) ;; see key bindings

;; turn off automatical backup
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

;; Recent opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 50)
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

;; active to load Dired Mode
;;(require 'dired)
;;(defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; load with delay
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwin-target 1)

(require 'org-pomodoro)

;; multi-term: a mode based on term.el, for managing multiple terminal buffers in Emacs
(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

(set-language-environment "UTF-8")

;;Modify company-active-map accordingly:
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; open finder; M-x reveal-in-osx-finder

(provide 'init-better-defaults)
