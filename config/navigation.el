;; Which-Key
(setup (:package which-key)
  (which-key-mode)
  (:option which-key-idle-delay 0.3))

;; Ivy
(setup (:package counsel)
  (ivy-mode)
  (:option ivy-use-virtual-buffers t
           ivy-re-builders-alist '((t . ivy--regex-ignore-order))
           ivy-count-format "%d/%d ")
  (:global "C-s" swiper
           "s-f" swiper
           "C-x C-f" counsel-find-file
           "C-x C-b" counsel-switch-buffer
           "M-x" counsel-M-x))

;; Ivy rich mode
(setup (:package ivy-rich)
  (ivy-rich-mode))