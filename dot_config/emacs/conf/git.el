;; git magic!

;; magit
(use-package magit
  :after evil-collection
  :bind
  (("<leader> g /" . #'magit)
   ("<leader> g g" . #'magit-status)))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh) ;;compatibility with diff-hl
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh) ;;compatibility with diff-hl

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))
