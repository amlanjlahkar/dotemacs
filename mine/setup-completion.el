;; -*- lexical-binding: t; -*-

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-quit-no-match t)
  (corfu-scroll-margin 10)
  (corfu-preselect-first nil)
  :init
  (global-corfu-mode))

(provide 'setup-completion)
