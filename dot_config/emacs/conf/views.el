;; Managing perspectives/views


;; persperctive
(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "<leader> TAB"))
  :init
  (persp-mode))

(use-package perspective-tabs
  :after (perspective)
  :straight (:host sourcehut :repo "woozong/perspective-tabs")
  :init
  (perspective-tabs-mode +1))
