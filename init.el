;; -*- lexical-binding: t; -*-

;; for measuring of startup time
(defun mine/display-startup-time ()
  (message "emacs started in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'mine/display-startup-time)

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
(recentf-mode t)
(save-place-mode t)
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)

;; external setups to be loaded(including packages)
(add-to-list 'load-path "~/.emacs.d/mine/")
(require 'setup-ui)
(require 'setup-ux)
;(require 'setup-projects)
(require 'setup-evil)
(require 'setup-completion)
(require 'setup-lsp)
(require 'setup-org)
