;;; package-build-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "package-build" "package-build.el" (24231 34574
;;;;;;  542297 798000))
;;; Generated autoloads from package-build.el

(autoload 'package-build-archive "package-build" "\
Build a package archive for the package named NAME.
if DUMP-ARCHIVE-CONTENTS is non-nil, the updated archive contents
are subsequently dumped.

\(fn NAME &optional DUMP-ARCHIVE-CONTENTS)" t nil)

(autoload 'package-build--package "package-build" "\
Create version VERSION of the package specified by RCP.
Return the archive entry for the package and store the package
in `package-build-archive-dir'.

\(fn RCP VERSION)" nil nil)

(autoload 'package-build-all "package-build" "\
Build a package for each of the available recipes.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "package-recipe-mode" "package-recipe-mode.el"
;;;;;;  (24231 34574 544836 454000))
;;; Generated autoloads from package-recipe-mode.el

(autoload 'package-build-create-recipe "package-recipe-mode" "\
Create a new recipe for the package named NAME using FETCHER.

\(fn NAME FETCHER)" t nil)

(autoload 'package-build-current-recipe "package-recipe-mode" "\
Build archive for the recipe defined in the current buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("package-build-badges.el" "package-build-pkg.el"
;;;;;;  "package-recipe.el") (24231 34574 554190 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; package-build-autoloads.el ends here
