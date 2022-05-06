;; -*- lexical-binding: t; -*-

(use-package projectile
  :diminish projectile-mode
  :bind ("C-c p" . projectile-command-map)
  :config
  (when (file-directory-p "~/projects/programming")
    (setq projectile-project-search-path '("~/projects/programming")))
  (setq projectile-switch-project-action #'consult-projectile)
  (projectile-mode))

(use-package consult-projectile
  :straight (consult-projectile :type git :host gitlab :repo "OlMon/consult-projectile" :branch "master")
  :after projectile)

(use-package treemacs
  :commands treemacs
  :config
  (setq treemacs-show-cursor nil)
  (treemacs-resize-icons 22)
  (set-face-attribute 'treemacs-root-face nil :font "Liberation Sans" :height 120 :weight 'bold))

(use-package treemacs-all-the-icons
  :after treemacs
  :config
  (treemacs-load-theme "all-the-icons"))

(use-package treemacs-evil
  :after (treemacs evil))

(provide 'setup-projects)
