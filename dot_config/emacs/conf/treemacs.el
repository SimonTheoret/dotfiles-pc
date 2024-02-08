;; Do I need it

;; Treemacs
(use-package treemacs
  :bind
  (:map global-map
	("<leader> p o" . treemacs))
  :defer t)


;; (use-package treemacs-icons-dired
;;   :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-magit
  :after (treemacs magit))
