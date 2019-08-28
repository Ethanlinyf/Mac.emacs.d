;;; init-abbrev.el --- Better default configurations.	-*- lexical-binding: t -*-

;;; Copyright (C) 2019

;; Author: Teamwork  <e.yflin@gmail.com>
;; URL: https://github.com/Ethanlinyf/Mac.emacs.d

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version, such as GPLv3
;; (URL: https://www.gnu.org/licenses/gpl-3.0.en.html).
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;;; Commentary:
;;
;;
;;; Code:


(require 'org2blog-autoloads)
(require 'netrc)

;; in my ~/.netrc/ I have:
;; machine TTE login my_username password my_password
;; machine wp-TE login my_username password my_password
;; so let's parse out each of the lines into a separate variable
(setq TTE (netrc-machine (netrc-parse "~/.netrc") "TTE" t))
;;(setq wp-TE (netrc-machine (netrc-parse "~/.netrc") "wp-TE" t))

(setq org2blog/wp-blog-alist
      `(("wordpress"
         :url "https://thethingsengine.org/xmlrpc.php"
	 ;;:username "my_username"
	 ;;:password 
	 :username ,(netrc-get TTE "login")
         :password ,(netrc-get TTE "password")
         :default-title "Hello World"
         :default-categories ("org2blog" "emacs")
         :tags-as-categories nil)
	))

;;(setq org2blog/wp-use-sourcecode-shortcode t)
; http://blog.binchen.org/posts/how-to-use-org2blog-effectively-as-a-programmer.html
;; has half the instructions, but was missing
;; `wp-use-sourcecode-shortcode` at the time of this writing, without
;; which this does not work at all.

;; * `M-x package-install RET htmlize` is required, else you get empty
;;   code blocks https://github.com/punchagan/org2blog/blob/master/org2blog.el
;; * with wp-use-sourcecode-shortcode set to 't, org2blog will use 
;;   shortcodes, and hence the SyntaxHighlighter Evolved plugin on your blog.
;;   however, if you set this to nil, native Emacs highlighting will be used,
;;   implemented as HTML styling. Your pick!
(setq org2blog/wp-use-sourcecode-shortcode nil)
;; removed light="true"
(setq org2blog/wp-sourcecode-default-params nil)
;; target language needs to be in here
(setq org2blog/wp-sourcecode-langs
      '("actionscript3" "bash" "coldfusion" "cpp" "csharp" "css" "delphi"
        "erlang" "fsharp" "diff" "groovy" "javascript" "java" "javafx" "matlab"
        "objc" "perl" "php" "text" "powershell" "python" "ruby" "scala" "sql"
        "vb" "xml"
        "sh" "emacs-lisp" "lisp" "lua"))

;; this will use emacs syntax higlighting in your #+BEGIN_SRC
;; <language> <your-code> #+END_SRC code blocks.

(provide 'init-org2blog)
