;; -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(setq display-line-numbers 'relative)

;; font setup
(defun mine/bface-mode-variable ()
   "set variable length font for current buffer"
   (interactive)
   (setq buffer-face-mode-face '(:family "IBM Plex Serif" :height 100))
   (buffer-face-mode))
(set-face-attribute 'default nil :family "IBM Plex Mono" :height 105)

(use-package emacs
  :init
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-paren-match '(bold)
        modus-themes-mode-line '(borderless)
        modus-themes-region '(bg-only no-extend))
  :config
  (load-theme 'modus-vivendi))

(use-package nano-modeline
  :init
  (setq nano-modeline-position "bottom"
        nano-modeline-space-top 0.2
        nano-modeline-space-bottom -0.3)
  :config
  (nano-modeline-mode t))

(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1)
  (setq which-key-frame-max-height 30)
  (which-key-mode))

(provide 'setup-ui)
