;; git magic!

;; magit
(use-package magit
  :after evil-collection
  :bind
  (("<leader> g /" . 'magit)))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh) ;;compatibility with diff-hl
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh) ;;compatibility with diff-hl
