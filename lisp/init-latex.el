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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AUCTex Initiating;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RefTex;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-toc-split-windows-horizontally t) ;;*toc*buffer on left。
(setq reftex-toc-split-windows-fraction 0.2)  ;;*toc*buffer ratio。
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)  
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;CDLaTeX;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;LaTex-mode settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook (lambda ()
		  (require 'init-auto-complete-settings)
                  (require 'init-yasnippet-settings)
		  (TeX-fold-mode 1)
		  (auto-fill-mode 1)

		  ;;;;;;;;;;;;;;;; flyspell settings
		  (flyspell-mode 1)
		  (setq flyspell-sort-corrections nil)
		  (setq flyspell-doublon-as-error-flag nil)

		  
		  (turn-on-auto-fill)              ;;LaTeX mode，turn off auto fold
		  (linum-mode 1)
		  ;;(auto-complete-mode 1)
		  (latex-math-mode 1)
		  (outline-minor-mode 1)            
  		  (imenu-add-menubar-index)

		  (setq TeX-show-compilation nil)   ;;NOT display compilation windows
		  (setq TeX-global-PDF-mode t       ;;PDF mode enable, not plain
		  		TeX-engine 'default)  ;;use xelatex default
		  (setq TeX-clean-confirm nil)
		  (setq TeX-save-query nil)
		 
                  (setq font-latex-fontify-script t)
		  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
		  (setq TeX-electric-escape t)      ;; press \ then, jump to mini-buffer to input commands
		  ;(setq TeX-view-program-list '(("Evince" "evince %o"))) ;;
		  ; (setq TeX-view-program-selection '((output-pdf "Evince")))
		  ;(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
		  ;(setq TeX-command-default "XeLaTeX")
                  (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))

		 
		  (define-key LaTeX-mode-map (kbd "C-c C-p") 'reftex-parse-all)
		  
                  ;;;;;;deeper directory;;;;;;;;;;;;;
                   ;(setq reftex-section-levels
                   ;     '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
                   ;       ("frametitle" . 4) ("subsubsection" . 4) ("paragraph" . 5)
                   ;       ("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))


                      (setq LaTeX-section-hook
                            '(LaTeX-section-heading
	                	LaTeX-section-title
		                LaTeX-section-toc
	                 	LaTeX-section-section
		                LaTeX-section-label))
));;







(provide 'init-latex)
