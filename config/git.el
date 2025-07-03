;; Magit
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)
(setup (:package magit)
  (:global "C-M-;" magit-status))