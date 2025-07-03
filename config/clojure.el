;; Clojure
(setup (:package lsp-mode lsp-ui lsp-ivy lsp-treemacs)
  (:hook lsp-enable-which-key-integration)
  (:bind "M-<f7>" lsp-find-references))

;; Clojure mode
(setup (:package clojure-mode)
  (:hook subword-mode
         paredit-mode
         lsp))

;; CIDER
(setup (:package cider)
  (:bind "C-c u" cider-user-ns
         "C-M-r" cider-refresh)
  (:option cider-show-error-buffer t
           cider-auto-select-error-buffer t
           cider-repl-history-file "~/.emacs.d/cider-history"
           cider-repl-pop-to-buffer-on-connect t
           cider-repl-wrap-history t))

(setup (:package company)
  (:hook-into cider-mode
	      cider-repl-mode))

;; CIDER Hydra
(setup (:package cider-hydra)
  (:hook-into clojure-mode))

;; Refactoring for CIDER
(setup (:package clj-refactor)
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (:hook-into clojure-mode))

;; Enable ParEdit in REPL
(setup cider-repl-mode
  (:hook paredit-mode))

;; Enable Clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))