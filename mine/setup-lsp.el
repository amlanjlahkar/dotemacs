;; -*- lexical-binding: t; -*-

;; preferences
(setq eldoc-echo-area-use-multiline-p nil
      flymake-start-on-flymake-mode nil
      flymake-start-on-save-buffer nil
      flymake-start-syntax-check-on-find-file nil)

;; use eglot for handling lsp servers
(use-package eglot
  :commands eglot-ensure
  :init
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) "clangd")))


(provide 'setup-lsp)
