

;; Better settings



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
     )

(require 'cl)

;; add whaterver packages you want here
 (defvar EthanLinyf/packages '(
			       ;; --- Auto-completion ---
		                company
				;; --- Better Editor ---
				hungry-delete
				swiper
				counsel
				smartparens
				;; --- Major Mode ---
				js2-mode
				;; --- Minor Mode ---
				nodejs-repl
				exec-path-from-shell
				;; --- Themes ---
				monokai-theme
				smex
				solarized-theme
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

;; turn off tool-bar-mode
(tool-bar-mode -1)

;; turn off scroll bar mode
(scroll-bar-mode -1)

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

;; Keybunding to F2
(global-set-key (kbd "s-1") 'open-init-file)

;; turn on the company mode
(global-company-mode 1)

;; turn off automatical backup
(setq make-backup-files nil)

;; Recent opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; highlighting on the syntex of different programming language
(require 'org)
(setq org-src-fontify-natively t)

;; add delete selection mode
(delete-selection-mode t)

;; full-screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

;; load theme
(load-theme 'monokai t)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smex)
(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

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

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(package-selected-packages (quote (monokai-theme company)))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
