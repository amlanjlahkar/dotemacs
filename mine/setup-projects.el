;; -*- lexical-binding: t; -*-

(use-package magit
  :init
  (setq magit-refresh-status-buffer nil)
  :commands (magit-status))
(provide 'setup-projects)
