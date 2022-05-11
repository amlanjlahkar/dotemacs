;; -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(setq display-line-numbers-type 'relative)

;; font setup
(set-face-attribute 'default nil :font "IBM Plex Mono")
(set-face-attribute 'fixed-pitch nil :font "IBM Plex Mono" :height 1.0)
(set-face-attribute 'variable-pitch nil :font "IBM Plex Sans")

(use-package emacs
  :init
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-paren-match '(bold)
        modus-themes-mode-line '(borderless accented)
        modus-themes-org-blocks 'grey-background
        modus-themes-region '(bg-only no-extend))
  :config
  (load-theme 'modus-operandi))

(use-package nano-modeline
  :init
  (setq nano-modeline-position "bottom"
        nano-modeline-space-top 0.2
        nano-modeline-space-bottom -0.3)
  :config
  (nano-modeline-mode))

(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1)
  (setq which-key-frame-max-height 30)
  (which-key-mode))

(provide 'setup-ui)
