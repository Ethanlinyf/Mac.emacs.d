
;;-------------------------------------------------------------------------
;;-------------------------------------------------------------------------
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
				popwin
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
