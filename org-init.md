
# Table of Contents

1.  [init.el settings](#orgdedb398)
    1.  [Load Emacs path](#org1fee45f)
    2.  [Load Require files](#orgc1d1e1a)
    3.  [Load Custom settings](#orgc8973a0)
    4.  [AutoLoad](#org0afce26)
    5.  [exclude file](#org9b0d230)



<a id="orgdedb398"></a>

# init.el settings


<a id="org1fee45f"></a>

## Load Emacs path

    (add-to-list 'load-path "~/.emacs.d/lisp/")


<a id="orgc1d1e1a"></a>

## Load Require files

    (require 'init-packages)
    (require 'init-package-configuration)
    (require 'init-better-defaults)
    (require 'init-ui)
    (require 'init-org)
    (require 'init-keybindings)
    (require 'init-javascript)
    (require 'init-abbrev)
    (require 'init-latex)
    (require 'init-mapping)
    (require 'init-org2blog)
    (require 'init-easypg)
    (require 'grid-mode)


<a id="orgc8973a0"></a>

## Load Custom settings

    (setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
    (load-file custom-file)


<a id="org0afce26"></a>

## AutoLoad


<a id="org9b0d230"></a>

## exclude file

-   recentf
-   abbrev, a model (init-abbrev) can be found from wiki page

