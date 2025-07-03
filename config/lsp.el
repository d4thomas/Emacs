;; Modeline
(setq lsp-modeline-code-actions-enable nil
      lsp-modeline-code-actions-segments '(count name)
      lsp-modeline-diagnostics-enable t
      lsp-modeline-workspace-status-enable nil)

;; Sideline
(setq lsp-ui-sideline-enable nil
      lsp-ui-sideline-show-code-actions t
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-code-actions-prefix "")

;; Headerline
(setq lsp-headerline-breadcrumb-enable nil
      lsp-headerline-breadcrumb-icons-enable nil)