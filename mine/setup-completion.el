;; -*- lexical-binding: t; -*-

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-quit-no-match t)
  (corfu-scroll-margin 10)
  :config
  (global-corfu-mode))

(provide 'setup-completion)
