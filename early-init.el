;; -*- lexical-binding: t; -*-

;; provide large threshold for garbage collection and
;; increase read size per process for performace gains
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216
          gc-cons-percentage 0.1
          read-process-output-max (* 1024 1024))))

;; also raise gc-cons-threshold while the minibuffer is active
(defun defer-gc-h ()
  (setq gc-cons-threshold most-positive-fixnum))
(defun restore-gc-h ()
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold doom-gc-cons-threshold))))
(add-hook 'minibuffer-setup-hook #'defer-gc-h)
(add-hook 'minibuffer-exit-hook #'restore-gc-)

;; change location for native compilation cache file
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
    (convert-standard-filename
      (expand-file-name  "etemp_data/eln-cache/" user-emacs-directory))))

;; some initial prefs
(setq inhibit-startup-message 1
      inhibit-startup-echo-area-message 1
      inhibit-startup-buffer-menu 1
      initial-scratch-message ""
      column-number-mode 1
      cursor-in-non-selected-windows nil)
(set-fringe-mode 10)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)

;; bootstrap straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq package-enable-at-startup nil
      straight-use-package-by-default t
      use-package-verbose t)

