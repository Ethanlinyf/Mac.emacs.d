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

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; turn on the company mode
(global-company-mode 1)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smex)
(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;;Combine the previous two lines
;;(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


(require 'popwin)
(popwin-mode t)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Org-pomodoro
(setq org-pomodoro-length 25)
(setq org-pomodoro-short-break-length 5)
(setq org-pomodoro-long-break-length 15)
(setq org-pomodoro-play-sounds 1)
;;(require 'sound-wav)
;;(sound-wav-play "/path/to/audio.wav")

;; grip-mode
;; Make a keybinding: `C-c C-c g'
;q(define-key markdown-mode-command-map (kbd "g") #'grip-mode)

;; Or start grip when opening a markdown/org buffer
;;(add-hook 'markdown-mode-hook #'grip-mode)
;;(add-hook 'org-mode-hook #'grip-mode)
;; Use keybindings
;(use-package grip-mode
;  :ensure t
;  :bind (:map markdown-mode-command-map
;         ("g" . grip-mode)))

;; Or using hooks
;;(use-package grip-mode
;;  :ensure t
;;  :hook ((markdown-mode org-mode) . grip-mode))

;; Flyspell
(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; web-mode:

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;; multi-term
(setq multi-term-program "/bin/zsh")

;; helm-ag

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; flycheck package
(add-hook 'js2-mode-hook 'flycheck-mode)

;;yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(window-numbering-mode 1)

;; evil mode
(evil-mode 1)
;;(setq evil-want-C-u-scroll t)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(global-evil-leader-mode)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )
;; Evil-surround
(require 'evil-surround)
(global-evil-surround-mode)

;;Evil-nerd-commenter

(evilnc-default-hotkeys)

(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; made some modes to use emacs-state
(dolist (mode '(ag-mode
                flycheck-error-list-mode
		occur-mode
                 git-rebase-mode))
   (add-to-list 'evil-emacs-state-modes mode))


(add-hook 'occur-mode-hook
          (lambda ()
            (evil-add-hjkl-bindings occur-mode-map 'emacs
              (kbd "/")       'evil-search-forward
              (kbd "n")       'evil-search-next
              (kbd "N")       'evil-search-previous
              (kbd "C-d")     'evil-scroll-down
              (kbd "C-u")     'evil-scroll-up
              )))

;; Which-key
(which-key-mode 1)
(which-key-setup-side-window-bottom)

;; file-management: neotree
 (use-package neotree
   :ensure t
   :init (setq neo-window-fixed-size nil
	       neo-theme (if (display-graphic-p) 'icons 'arrow)
	       neo-smart-open t)
   :bind (("s-8" . neotree-toggle)))
;; (require 'neotree)
;; (global-set-key (kbd "s-8") 'neotree-toggle)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (setq neo-smart-open t)



;; use-package
(require 'use-package)
(provide 'init-package-configuration)
