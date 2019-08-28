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


(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(provide 'init-javascript)
