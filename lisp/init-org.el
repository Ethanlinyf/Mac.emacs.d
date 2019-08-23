

(setq org-directory "/users/ethanlin/MySpacemacs/")

(setq org-list-allow-alphabetical t)

;; highlighting on the syntex of different programming language
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
