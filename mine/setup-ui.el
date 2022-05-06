;; -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; font setup
(defun mine/bface-mode-variable ()
   "set variable length font for current buffer"
   (interactive)
   (setq buffer-face-mode-face '(:family "Liberation Sans" :height 100))
   (buffer-face-mode))
(set-face-attribute 'default nil :family "Cascadia Code PL" :height 95)

(use-package all-the-icons ;; all-the-icons install fonts upon first usage 
  :if (display-graphic-p))
(load-theme 'modus-operandi)

;; splash screen
(use-package dashboard
  :config
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
        dashboard-startup-banner 'logo
        dashboard-banner-logo-title "Welcome to emacs, Amlan"
        dashboard-center-content t
        dashboard-set-footer nil
        dashboard-projects-backend 'projectile
        dashboard-items '((projects . 3)
                          (recents . 5)))
  (add-hook 'dashboard-mode-hook
        (lambda ()
          (make-local-variable 'mode-line-format)
          (setq mode-line-format nil)))
  (dashboard-setup-startup-hook))

;; describe keybinds in real time
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(provide 'setup-ui)
