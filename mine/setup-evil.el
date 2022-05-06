;; -*- lexical-binding: t; -*-

;; use vim bindings for navigation using evil-mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-i-jump t)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (setq evil-cross-lines t
	evil-move-beyond-eol t
	evil-symbol-word-search t
	evil-want-Y-yank-to-eol t
	evil-cross-lines t
	evil-echo-state nil))

;; highlight yanked region
;; thanks to meain for the tip
(with-eval-after-load 'evil
  (defun mine/evil-yank-advice (orig-fn beg end &rest args)
    (pulse-momentary-highlight-region beg end)
    (apply orig-fn beg end args))
  (advice-add 'evil-yank :around 'mine/evil-yank-advice))

(provide 'setup-evil)
