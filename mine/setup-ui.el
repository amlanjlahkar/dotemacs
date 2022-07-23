;; -*- lexical-binding: t; -*- 

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(setq display-line-numbers-type 'relative)

;; font setup
(set-face-attribute 'default nil :font "JetBrains Mono" :height 105)
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono" :height 1.0)
(set-face-attribute 'variable-pitch nil :font "Inter")

(use-package emacs
  :init
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-paren-match '(bold)
        ;; modus-themes-mode-line '3d
        modus-themes-org-blocks 'grey-background
        modus-themes-region '(bg-only no-extend))
  :config
  (load-theme 'modus-operandi t))

(use-package hide-mode-line)
(use-package mood-line
  :config
  (mood-line-mode))

(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1)
  (setq which-key-frame-max-height 30)
  (which-key-mode))

(use-package pulsar  
  :config
  (setq pulsar-pulse-functions
        '(recenter-top-bottom
          move-to-window-line-top-bottom
          reposition-window
          forward-page
          backward-page
          org-next-visible-heading
          org-previous-visible-heading
          org-forward-heading-same-level
          org-backward-heading-same-level
          outline-backward-same-level
          outline-forward-same-level
          outline-next-visible-heading
          outline-previous-visible-heading
          outline-up-heading))

  (setq pulsar-pulse-on-window-change t)
  (setq pulsar-pulse t)
  (setq pulsar-delay 0.042)
  (setq pulsar-iterations 10)
  (setq pulsar-face 'pulsar-magenta)
  (setq pulsar-highlight-face 'pulsar-yellow)
  
  (pulsar-global-mode))

(provide 'setup-ui)
