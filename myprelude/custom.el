;;; package --- Summary
;;; Commentary:
;; personal settings.  includes: yasnippet, company-c-headers, iedit, flymake-google-cpplint, google-c-style, semantics, cedet.
;;; Code:

;; yasnippet
(prelude-require-package 'yasnippet)
(yas-global-mode 1)

;;company-c-headers
(add-to-list 'company-backends 'company-c-headers)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/4.8/" "/usr/include/x86_64-linux-gnu/c++/4.8/" "/usr/include/c++/4.8/backward/" "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/" "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/" "/usr/include/x86_64-linux-gnu/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; iedit-mode
(prelude-require-package 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)


;;flymake-google-cpplint
(prelude-require-package 'flymake-google-cpplint)
(add-hook 'c++-mode-hook 'flymake-google-cpplint-load)
(add-hook 'c-mode-hook 'flymake-google-cpplint-load)
;;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(custom-set-variables
 '(flycheck-googlelint-verbose "3")
 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
 '(flycheck-googlelint-root "project/src")
 '(flycheck-googlelint-linelength "120"))
(custom-set-variables
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint.py"))

;; google-c-style
(prelude-require-package 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (eval-after-load 'flycheck
;;   '(progn
;;      (require 'flycheck-google-cpplint)
;;      ;; Add Google C++ Style checker.
;;      ;; In default, syntax checked by Clang and Cppcheck.
;;      (flycheck-add-next-checker 'c/c++-clang
;;                                 'c/c++-googlelint 'append)))

;; turn on Semantic
(semantic-mode 1)
;; (global-ede-mode)
;; (ede-cpp-root-project "mypro"
;;                       :file "~/mypro/src/main.cpp"
;;                       :include-path '("/../inc")
;;                       )

;; (defun my:add-semantic-to-autocomplete()
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;; )
;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(provide 'custom)
;;; custom.el ends here
