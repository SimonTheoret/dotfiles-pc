;; Projects manager

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
