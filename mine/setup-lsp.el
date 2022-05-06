;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (lsp-enable-which-key-integration t)
  (setq lsp-keymap-prefix "C-c l"
	lsp-enable-symbol-highlighting nil
	lsp-diagnostics-provider :node
	lsp-modeline-diagnostics-enable nil
	lsp-headerline-breadcrumb-icons-enable t
	lsp-headerline-breadcrumb-enable-diagnostics nil
	lsp-signature-render-documentation nil
	lsp-completion-provider :none
	lsp-log-io nil))

(provide 'setup-lsp)
