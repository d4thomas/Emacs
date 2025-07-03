;; ParEdit
(setup (:package paredit)
  (:hook-into emacs-lisp-mode
	      eval-expression-minibuffer-setup
	      ielm-mode
	      lisp-mode
	      lisp-interaction-mode
	      scheme-mode))

(setup turn-on-eldoc-mode
  (:hook-into emacs-lisp-mode
	 lisp-interaction-mode
	 iel-mode))

;; Rainbow delimiters
(setup (:package rainbow-delimiters)
  (:hook-into prog-mode))