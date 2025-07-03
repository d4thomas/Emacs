;; Setup package manager
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(if (package-installed-p 'setup)
    nil
  (if (memq 'setup package-archive-contents)
      nil
    (package-refresh-contents))
  (package-install 'setup))
(require 'setup)

;; Load configuration files
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(defvar addons
  '("ui.el"
    "navigation.el"
    "projects.el"
    "git.el"
    "filetree.el"
    "editing.el"
    "elisp.el"
    "clojure.el"
    "lsp.el"
    "shell.el"))

(dolist (file addons)
  (load
    (expand-file-name file (expand-file-name "config" user-emacs-directory))))

;; Speed up garbage collection
(setq gc-cons-threshold (* 2 1000 1000))

;; Save UI changes to a separate file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)