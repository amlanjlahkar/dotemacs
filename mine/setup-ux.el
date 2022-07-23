;; -*- lexical-binding: t; -*-

;; customize scrolling behavior
(setq scroll-step 1
      scroll-margin 20
      scroll-conservatively 5
      minibuffer-scroll-conservatively 5
      scroll-preserve-screen-position 1)

;; don't use tabs
(setq-default indent-tabs-mode nil
              tab-width 2
              truncate-lines +1)

;; Minibuffer Completion
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
  (completion-styles '(orderless partial-completion))
  (completion-category-overrides '((file (styles . (orderless partial-completion))))))

;; Navigation and File management
(use-package consult
  :after vertico
  :config
  (consult-customize
   consult-theme :preview-key nil
   (setq consult-project-function #'consult--default-project--function)))

(use-package all-the-icons)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :init (setq all-the-icons-dired-monochrome nil))

(use-package dired
  :straight nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "--group-directories-first -AlGh")))

(provide 'setup-ux)
