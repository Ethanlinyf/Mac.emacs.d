;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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
