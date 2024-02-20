;;; -*- lexical-binding: t; -*-

;; Managing perspectives/views


;; perspective
(use-package
 perspective
 :custom
 (persp-mode-prefix-key (kbd "<leader> <tab>")) ; pick your own prefix key here
 :init (persp-mode))

;;nameframe
(use-package
 nameframe
 :after perspective
 :config
 (nameframe-projectile-mode t)
 (nameframe-perspective-mode t))

;; persp-mode
;; (use-package
;;  persp-mode
;;  :custom
;;  (persp-keymap-prefix (kbd "<leader> <tab>"))
;;  (persp-auto-save-opt 0)
;;  (persp-auto-resume-time -1)
;;  (persp-nil-name "main")
;;  :init (persp-mode))
;; (setq-default persp-nil-name "main"))

(with-eval-after-load "persp-mode-autoloads"
  (setq persp-autokill-buffer-on-remove 'kill-weak))


;; Not Needed. It is in the bottom right corner
;; (use-package perspective-tabs
;;   :after (perspective)
;;   :straight (:host sourcehut :repo "woozong/perspective-tabs")
;;   :init
;;   (perspective-tabs-mode +1))
