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
(setq reftex-toc-split-windows-horizontally t) ;;*toc*buffer在左侧。
(setq reftex-toc-split-windows-fraction 0.2)  ;;*toc*buffer 使用整个frame的比例。
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
		  (require 'auto-complete-settings)
                  (require 'yasnippet-settings)
		  (TeX-fold-mode 1)

		  ;;;;;;;;;;;;;;;; flyspell settings
		  (flyspell-mode 1)
		  (setq flyspell-sort-corrections nil)
		  (setq flyspell-doublon-as-error-flag nil)

		  
		  (turn-off-auto-fill)              ;;LaTeX模式下，不打开自动折行
		  (linum-mode 1)
		  (auto-complete-mode 1)
		  (latex-math-mode 1)
		  (outline-minor-mode 1)            ;;使用 LaTeX mode 的时候打开 outline mode
  		  (imenu-add-menubar-index)

		  (setq TeX-show-compilation nil)   ;;NOT display compilation windows
		  (setq TeX-global-PDF-mode t       ;;PDF mode enable, not plain
		  		TeX-engine 'latex)  ;;use xelatex default
		  (setq TeX-clean-confirm nil)
		  (setq TeX-save-query nil)
		 
                  (setq font-latex-fontify-script t)
		  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
		  (setq TeX-electric-escape t)      ;; 按 \ 后光标跳到mini-buffer里面输入命令
		  ;(setq TeX-view-program-list '(("Evince" "evince %o"))) ;;重新定义pdf viewer
		  ; (setq TeX-view-program-selection '((output-pdf "Evince")))
		  ;(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
		  ;(setq TeX-command-default "XeLaTeX")
                  (setq TeX-fold-env-spec-list (quote (("[comment]" ("comment")) ("[figure]" ("figure")) ("[table]" ("table"))("[itemize]"("itemize"))("[enumerate]"("enumerate"))("[description]"("description"))("[overpic]"("overpic"))("[tabularx]"("tabularx"))("[code]"("code"))("[shell]"("shell")))))

		  ;;定义latex-mode下的快捷键
		  (define-key LaTeX-mode-map (kbd "C-c C-p") 'reftex-parse-all)
		  
                  ;;;;;;设置更深层的目录;;;;;;;;;;;;;
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
