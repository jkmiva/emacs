(add-to-list 'load-path "~/.emacs.d/myplugin") ;; set load-path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq-default tab-width 4) ;; tab width
(defvaralias 'c-basic-offset 'tab-width)

(global-linum-mode t) ;; add line-number-at-pos
(add-hook 'after-init-hook 'global-company-mode)
;;(add-hook 'after-init-hook 'global-undo-tree-mode)
(setq send-mail-function 'mailclient-send-it) 
(require 'undo-tree)
(global-undo-tree-mode) ;; enable undo-tree mode
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(load-theme 'zenburn t)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) ;; org-mode break line

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
