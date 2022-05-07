;; -*- lexical-binding: t; -*-

;; customize scrolling behavior
(setq scroll-step 1
      scroll-margin 20
      scroll-conservatively 5
      minibuffer-scroll-conservatively 5
      scroll-preserve-screen-position 1)

;; don't use tabs
(setq-default indent-tabs-mode nil
              tab-width 2)

;; minimal completion system
(use-package vertico
  :config
  (vertico-mode)
  (setq vertico-count 15))

;; annotations for completion entries
(use-package marginalia
  :after vertico
  :config
  (marginalia-mode))

;; orderless filtering of completion entries
(use-package orderless
  :after vertico
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :after vertico
  :config
  (consult-customize
   consult-theme :preview-key nil
   (autoload 'projectile-project-root "projectile")
   (setq consult-project-function (lambda (_) (projectile-project-root)))))

(provide 'setup-ux)
