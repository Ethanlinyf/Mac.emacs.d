

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


(provide 'init-package-configuration)
