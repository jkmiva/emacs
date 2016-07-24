;;; package --- Summary
;;; Commentary:
;; start ede mode
;;; Code:
(global-ede-mode)
;; test project
(ede-cpp-root-project "mypro"
                      :file "~/mypro/src/main.cpp"
                      :include-path '("/../inc")
                      )






(provide 'cedet-projects)
;;; cedet-projects.el ends here
