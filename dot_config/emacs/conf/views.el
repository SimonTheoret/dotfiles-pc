;; Managing perspectives/views


;; persperctive
(use-package persp-mode
  :custom
  (persp-keymap-prefix (kbd "<leader> <tab>"))
  (persp-auto-save-opt 0)
  (persp-auto-resume-time -1)
  :init
  (persp-mode)
  (setq-default persp-nil-name "main"))

(with-eval-after-load "persp-mode-autoloads"
  (setq persp-autokill-buffer-on-remove 'kill-weak))


;; Not Needed. It is in the bottom right corner
;; (use-package perspective-tabs
;;   :after (perspective)
;;   :straight (:host sourcehut :repo "woozong/perspective-tabs")
;;   :init
;;   (perspective-tabs-mode +1))


