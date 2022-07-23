;; -*- lexical-binding: t; -*-

;; for measuring of startup time
(defun mine/display-startup-time ()
  (message "emacs started in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'mine/display-startup-time)

;; some personal preferences
(setq column-number-mode 1
      cursor-in-non-selected-windows nil
      global-auto-revert-non-file-buffers t
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)
(recentf-mode t)
(save-place-mode t)
(global-auto-revert-mode t)
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

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

;; external setups to be loaded(including packages)
(add-to-list 'load-path "~/.emacs.d/mine/")
(require 'setup-ui)
(require 'setup-ux)
(require 'setup-projects)
(require 'setup-evil)
(require 'setup-completion)
(require 'setup-lsp)
(require 'setup-org)
(require 'setup-orgpublish)
