(TeX-add-style-hook
 "Mac.emacs.d_GTD"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:org8dba1a0"
    "sec:orgd696670"
    "sec:orgb2cf611"
    "sec:org6b38f8b"
    "sec:org0062164"
    "sec:org1e71e40"
    "sec:orga2a7d36"
    "sec:orge5415fd"
    "sec:orge65f243"
    "sec:org83d23ed"
    "sec:org318ca99"
    "sec:org1110622"
    "sec:orgdc1b58e"
    "sec:orgc1cb310"
    "sec:orgb4f50fd"
    "sec:org18e7a76"
    "sec:org3838a20"
    "sec:org9c053d0"
    "sec:org0bfce3a"
    "sec:org1808f9a"))
 :latex)

