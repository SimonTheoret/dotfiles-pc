;; Projects manager

;; magit
(use-package magit
  :after evil-collection
  :bind
  (("<leader> g /" . 'magit)))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh) ;;compatibility with diff-hl
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh) ;;compatibility with diff-hl



;; projectile
(use-package projectile
  :config
  (projectile-mode +1)
  :bind
  (:map global-map
	("<leader> p m" . 'projectile-command-map)
	("<leader> SPC" . 'projectile-find-file)
	("<leader> p p" . 'projectile-switch-project)
	("<leader> p a" . 'projectile-add-known-project)
	("<leader> p d" . 'projectile-remove-known-project)))
