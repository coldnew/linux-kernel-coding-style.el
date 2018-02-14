;;; linux-kernel-coding-style.el --- linux kernel coding style in emacs. -*- lexical-binding:t -*-

;; Copyright (c) 2018 Yen-Chin, Lee.
;;
;; Author: coldnew <coldnew.tw@gmail.com>
;; Keywords: converience
;; X-URL: http://github.com/coldnew/linux-kernel-coding-style.el
;; Version: 0.1

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;; Installation:

;;; Code:

(eval-when-compile (require 'cl))
(require 'cc)

(defun linux-kernel-coding-style/c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

;; Add Linux kernel style
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-add-style "linux-kernel"
			 '("linux" (c-offsets-alist
				    (arglist-cont-nonempty
				     c-lineup-gcc-asm-reg
				     linux-kernel-coding-style/c-lineup-arglist-tabs-only))))))

(defun linux-kernel-coding-style/setup ()
  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (when (and filename
	       (or (locate-dominating-file filename "Kbuild")
		   (locate-dominating-file filename "Kconfig")
		   (save-excursion (goto-char 0)
				   (search-forward-regexp "^#include <linux/\\(module\\|kernel\\)\\.h>$" nil t))))
      (setq indent-tabs-mode t)
      (setq tab-width 8)
      (setq c-basic-offset 8)
      (c-set-style "linux-kernel")
      (message "Setting up indentation for the linux kernel"))))

(add-hook 'c-mode-hook 'linux-kernel-coding-style/setup)



(provide 'linux-kernel-coding-style)
;;; linux-kernel-coding-style.el ends here