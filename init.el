;; -*- lexical-binding: t; -*-

;; keep user-emacs-directory clean with no-littering
(use-package no-littering
  :init
  (setq no-littering-etc-directory
    (expand-file-name "etemp_conf/" user-emacs-directory))
  (setq no-littering-var-directory
    (expand-file-name "etemp_data/" user-emacs-directory))
  :config
  (setq auto-save-file-name-transforms
    `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (load custom-file 'noerror 'nomessage)
)
;; minimize garbage collection interference with user activity
(use-package gcmh
  :init
  (gcmh-mode 1))

;; some personal preferences
(setq line-spacing 1)
(setq column-number-mode 1)
(setq cursor-in-non-selected-windows nil)
(save-place-mode 1)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; external setups to be loaded(including packages)
(add-to-list 'load-path "~/.emacs.d/mine/")
(require 'setup-ui)
(require 'setup-ux)
(require 'setup-projects)
(require 'setup-evil)
(require 'setup-completion)
(require 'setup-lsp)
