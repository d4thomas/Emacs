;; Treemacs
(setup (:package treemacs treemacs-projectile treemacs-magit)
  (:global "M-0" treemacs-select-window
           "M-o" ace-window ;; treemacs brings ace-window as a dependency
           "s-b" treemacs))
(setq treemacs-no-png-images t)