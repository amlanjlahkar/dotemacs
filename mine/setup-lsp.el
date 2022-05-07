;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-enable-symbol-highlighting nil
        lsp-diagnostics-provider nil
        lsp-modeline-diagnostics-enable nil
        lsp-headerline-breadcrumb-icons-enable t
        lsp-headerline-breadcrumb-enable-diagnostics nil
        lsp-signature-render-documentation nil
        lsp-completion-provider :none
        lsp-log-io nil)
  :commands (lsp lsp-deferred)
  :config
  (lsp-enable-which-key-integration t))

(use-package tree-sitter-langs)
(use-package tree-sitter
  :after lsp-mode
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(provide 'setup-lsp)
