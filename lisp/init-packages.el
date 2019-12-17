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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
;;  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "http://elpa.emacs-china.org/melpa/") t)
  (add-to-list 'package-archives '("melpa-gnu" . "http://elpa.emacs-china.org/gnu/") t)
  )

(require 'cl)

;; add whaterver packages you want here
(defvar EthanLinyf/packages '(
			      company
			      hungry-delete
			      swiper
			      counsel
			      smartparens
			      js2-mode
			      nodejs-repl
			      exec-path-from-shell
			      monokai-theme
			      smex
			      solarized-theme
			      popwin
			      reveal-in-osx-finder
			      org-pomodoro
			      sound-wav
			      magit
			      auctex
			      dash
			      yasnippet
			      auto-complete
			      htmlize
			      hydra
			      metaweblog
			      xml-rpc
			      org2blog
			      grip-mode ;;preview
			      multi-term ;; for creating and managing multiple terminal buffers in Emacs
			      slime ;; Superior Lisp Interaction Mode for Emacs, learning Emacs lisp.
			      grip-mode ;; Instant Github-flavored Markdown/Org preview using grip
			      web-mode
			      js2-refactor
			      expand-region
			      iedit
			      evil
			      evil-leader
			      helm-ag
			      flycheck
			      auto-yasnippet
			      window-numbering
			      powerline
			      ) "Default packages")

(setq package-selected-packages EthanLinyf/packages)

(defun EthanLinyf/packages-installed-p ()
  (loop for pkg in EthanLinyf/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (EthanLinyf/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg EthanLinyf/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'init-packages)
