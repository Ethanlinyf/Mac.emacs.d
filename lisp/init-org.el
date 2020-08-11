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


(setq org-directory "/users/ethanlin/MySpacemacs/")
(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-list-allow-alphabetical t)

;; highlighting on the syntex of different programming language
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("/Users/ethanlin/MySpacemacs/EthanYufengLinOrg/Private/"))
(global-set-key (kbd "C-c a") 'org-agenda)


(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-crypt-tag-matcher "crypt")
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
(setq org-crypt-key nil)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/Users/ethanlin/MySpacemacs/EthanYufengLinOrg/Private/gtd.org" "Tips")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)

;; Org Bullet
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook 'org-bullets-mode)

(use-package org-bulle
  :hook (org-mode . org-bullets-mode))

;; set TODO keywords as workflow states
(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "|" "DONE" "CANCELED")))

(setq org-todo-keyword-faces
  '(("TODO" . (:foreground "#ff39a3" :weight bold))
("WAITING" . "#E35DBF")
("CANCELED" . (:foreground "white"  :weight bold))
))

(provide 'init-org)

