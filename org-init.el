(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'use-package)

(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-org)
(require 'init-javascript)
(require 'init-abbrev)
(require 'init-latex)
(require 'init-mapping)
(require 'init-org2blog)
(require 'init-easypg)
(require 'init-web-development)
(require 'init-package-configuration)
(require 'init-keybindings)
;;(require 'grid-mode)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


