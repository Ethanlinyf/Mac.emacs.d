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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(org-agenda-files
   (quote
    ("~/MySpacemacs/EthanYufengLinOrg/Project/ThingsEngine/ThingsEngine-Git/ThingsEngine_Git.org" "/Users/ethanlin/org/gtd.org")))
 '(package-selected-packages
   (quote
    (org-bullets use-ttf abc-mode pkg-info popup powerline slime transient treepy undo-tree use-package web-mode window-numbering with-editor xml-rpc yasnippet package-build shut-up epl git commander f dash s pallet 2048-game which-key let-alist latex-extra latex-math-preview latex-unicode-math-mode cdlatex company hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell monokai-theme smex solarized-theme popwin reveal-in-osx-finder org-pomodoro sound-wav magit auctex)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 80)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
