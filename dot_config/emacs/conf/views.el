;; Managing perspectives/views


;; persperctive
(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "<leader> TAB"))
  :init
  (persp-mode))

;; Not Needed. It is in the bottom right corner
;; (use-package perspective-tabs
;;   :after (perspective)
;;   :straight (:host sourcehut :repo "woozong/perspective-tabs")
;;   :init
;;   (perspective-tabs-mode +1))


