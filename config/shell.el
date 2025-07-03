;; Configure shell path
(provide 'shell)
(when (memq window-system '(mac ns))
  (setup (:package exec-path-from-shell)
    (exec-path-from-shell-initialize)))