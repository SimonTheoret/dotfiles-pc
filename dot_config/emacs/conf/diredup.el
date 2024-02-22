;;; -*- lexical-binding: t; -*-


;; Makes dired goooood

(use-package diff-hl :config (global-diff-hl-mode))

(use-package diredfl :config (diredfl-global-mode))

(use-package
  dired-rsync
  :bind (:map dired-mode-map ("C-c C-r" . dired-rsync)))

(use-package
  dired-rsync-transient
  :bind
  (:map dired-mode-map ("C-c C-x" . dired-rsync-transient)))

;; (use-package dirvish)
;; (dirvish-override-dired-mode)
