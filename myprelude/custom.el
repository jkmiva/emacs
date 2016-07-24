;;; package --- Summary
;;; Commentary:
;; personal settings.  includes: yasnippet, company-c-headers, iedit, flymake-google-cpplint, google-c-style, semantics, cedet.
;; update1: add features for python, pylint, anaconda-mode
;; update2: enable helm, helm-gtags
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
 '(column-number-mode t)
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/4.8/" "/usr/include/x86_64-linux-gnu/c++/4.8/" "/usr/include/c++/4.8/backward/" "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/" "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed/" "/usr/include/x86_64-linux-gnu/")))
 '(display-battery-mode t)
 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
 '(flycheck-googlelint-linelength "120")
 '(flycheck-googlelint-root "project/src")
 '(flycheck-googlelint-verbose "3")
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint.py")
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))

;; iedit-mode
(prelude-require-package 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)


;;flymake-google-cpplint
(prelude-require-package 'flymake-google-cpplint)
(add-hook 'c++-mode-hook 'flymake-google-cpplint-load)
(add-hook 'c-mode-hook 'flymake-google-cpplint-load)
;;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;(add-hook 'c-mode-common-hook 'google-make-newline-indent)



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

;; python-mode,  pylint, anaconda-mode
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-to-list 'company-backends 'company-jedi)
;; (defun run-python-once ()
;;   (remove-hook 'python-mode-hook 'run-python-once)
;;   (run-python (python)))
;; (add-hook 'python-mode-hook 'run-python-once)

(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)
;;


;;; Enable helm-gtags-mode
(prelude-require-package 'helm-gtags)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))


(provide 'custom)
;;; custom.el ends here
