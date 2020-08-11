;; (use-package neotree
;;   :ensure t
;;   :init (setq neo-window-fixed-size nil
;; 	      neo-theme (if (display-graphic-p) 'icons 'arrow))
;;   :bind (("<f8>" . neotree-toggle)))

(use-package centaur-tabs
  :ensure t
  :config
  ;;(centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
	centaur-tabs-height 22
	centaur-tabs-set-icons t
	centaur-tabs-plain-icons t
	centaur-tabs-gray-out-icons t
	centaur-tabs-set-close-button t
	centaur-tabs-set-modified-marker t
	centaur-tabs-show-navigation-buttons t
	centaur-tabs-set-bar 'left
	centaur-tabs-cycle-scope 'tabs
	x-underline-at-descent-line nil)
  (centaur-tabs-headline-match)
  ;; (setq centaur-tabs-gray-out-icons 'buffer)
  ;; (centaur-tabs-enable-buffer-reordering)
  ;; (setq centaur-tabs-adjust-buffer-order t)
   (setq uniquify-separator "/")
  (setq uniquify-buffer-name-style 'forward)
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.
 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
     (cond
      ((ignore-errors
	 (and (string= "*xwidget" (substring (buffer-name) 0 8))
	      (not (string= "*xwidget-log*" (buffer-name)))))
       "Xwidget")
      ((or (string-equal "*" (substring (buffer-name) 0 1))
	   (memq major-mode '(magit-process-mode
			      magit-status-mode
			      magit-diff-mode
			      magit-log-mode
			      magit-file-mode
			      magit-blob-mode
			      magit-blame-mode
			      )))
       "Emacs")
      ((derived-mode-p 'prog-mode)
       "Editing")
      ((derived-mode-p 'dired-mode)
       "Dired")
      ((memq major-mode '(helpful-mode
			  help-mode))
       "Help")
      ((memq major-mode '(org-mode
			  org-agenda-clockreport-mode
			  org-src-mode
			  org-agenda-mode
			  org-beamer-mode
			  org-indent-mode
			  org-bullets-mode
			  org-cdlatex-mode
			  org-agenda-log-mode
			  diary-mode))
       "OrgMode")
      (t
       (centaur-tabs-get-group-name (current-buffer))))))
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (term-mode . centaur-tabs-local-mode)
  (calendar-mode . centaur-tabs-local-mode)
  (org-agenda-mode . centaur-tabs-local-mode)
  (helpful-mode . centaur-tabs-local-mode)
  :bind
  ("C-c b" . centaur-tabs-backward)
  ("C-c n" . centaur-tabs-forward)
  ("C-c m" . centaur-tabs-forward-group)
  ("C-c v" . centaur-tabs-backward-group))


(provide 'init-filemanage)
