(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-package-configuration)
(require 'init-better-defaults)
(require 'init-UI)
(require 'init-org)
(require 'init-keybindings)
(require 'init-javascript)
(require 'init-abbrew)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


