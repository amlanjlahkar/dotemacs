;; -*- lexical-binding: t; -*-

(defun mine/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode t)
  (visual-line-mode t))

(defun mine/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; set custom font for org-heading levels
  (dolist (face '((org-level-1 . 1.44)
                  (org-level-2 . 1.35)
                  (org-level-3 . 1.26)
                  (org-level-4 . 1.17)
                  (org-level-5 . 1.08)
                  (org-level-6 . 1.00)))
    (set-face-attribute (car face) nil :font "Liberation Serif" :weight 'normal :height (cdr face)))

  ;; use fixed-pitch font for certain org faces
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

;; use custom languages for orb babel
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (C . t)))

(use-package org
  :straight nil
  :hook (org-mode . mine/org-mode-setup)
  :config (mine/org-font-setup))

(provide 'setup-org)
