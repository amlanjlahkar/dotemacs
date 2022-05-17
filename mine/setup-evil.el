;; -*- lexical-binding: t; -*-

;; use vim bindings for navigation using evil-mode
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-i-jump t
        evil-undo-system 'undo-fu
        evil-shift-width 2
        evil-cross-lines t
        evil-move-beyond-eol t
        evil-symbol-word-search t
        evil-want-Y-yank-to-eol t
        evil-echo-state nil)
  :config
  (add-hook 'evil-visual-state-entry-hook (lambda () (setq-local hl-line-mode nil)))
  (add-hook 'evil-visual-state-exit-hook (lambda () (setq-local hl-line-mode t)))
  (evil-mode 1))

(use-package undo-fu
  :straight (undo-fu :type git :host github :repo "emacsmirror/undo-fu")) 
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; custom keybinds
(defvar my-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(define-key evil-normal-state-map (kbd "SPC") my-leader-map)
(define-key my-leader-map "r" 'consult-recent-file)

;; highlight yanked region
;; thanks to meain for the tip
(with-eval-after-load 'evil
  (defun mine/evil-yank-advice (orig-fn beg end &rest args)
    (pulse-momentary-highlight-region beg end)
    (apply orig-fn beg end args))
  (advice-add 'evil-yank :around 'mine/evil-yank-advice))

(provide 'setup-evil)
