(tooltip-mode -1)                 ;; Disable tooltips
(tool-bar-mode -1)                ;; Disable toolbar
(scroll-bar-mode -1)              ;; Disable visible scrollbar
(blink-cursor-mode 1)             ;; Enable blinking cursor
(setq create-lockfiles nil)       ;; Disable ~ files
(fset 'yes-or-no-p 'y-or-n-p)     ;; Changes all yes/no to y/n
(setq inhibit-startup-message t)  ;; Disable startup message
(setq ring-bell-function 'ignore) ;; Disable audible bell

;; Show full path in title bar
(setq-default frame-title-format "%b (%f)")

;; Initial frame height and width
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 200))

;; Font
(set-face-attribute 'default nil :height 140)
(set-face-attribute 'default nil :font "Berkeley Mono Variable")

;; Disable font popup window on macOS
(when (string-equal system-type "darwin") 'ok
  (global-set-key (kbd "s-t") '(lambda () (interactive))))

;; Doom modeline 
(setup (:package all-the-icons))
(setup (when (not (string-equal system-type "windows-nt"))
         (:package doom-modeline)
         (doom-modeline-mode t)))

;; Doom themes
(setup (:package doom-themes)
  (when (not custom-enabled-themes)
    (load-theme 'doom-one-light t)))

;; Clipboard, selection, and search
(setq
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

;; Window split with C-x | 
(defun toggle-window-split ()
  "Toggle between vertical and horizontal split for two windows."
  (interactive)
  (when (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
           (next-win-buffer (window-buffer (next-window)))
           (this-win-edges (window-edges (selected-window)))
           (next-win-edges (window-edges (next-window)))
           (split-vertically
            (= (car this-win-edges)
               (car next-win-edges)))
           (splitter
            (if split-vertically
                #'split-window-horizontally
              #'split-window-vertically)))
      (delete-other-windows)
      (let ((first-win (selected-window)))
        (funcall splitter)
        (if split-vertically
            (set-window-buffer (next-window) next-win-buffer)
          (set-window-buffer (next-window) this-win-buffer))
        (select-window first-win)))))
(global-set-key (kbd "C-x |") #'toggle-window-split)

;; Clean menubar
(let ((tool-items '(news
                    encrypt
                    quick-calc
                    directory
                    browse-net
                    mail
                    rmail
                    compose-mail
                    directory-search
                    browse-web
                    calendar
                    calc
                    simple-calculator
                    encryption-decryption
                    games
                    gnus)))
  (dolist (item tool-items)
    (define-key global-map (vector 'menu-bar 'tools item) nil)))