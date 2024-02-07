;;;;;;;;; org-mode ;;;;;;;;

;; org-mode prettify
(use-package org-superstar
  :init
  (require 'org-superstar)
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package org-fancy-priorities
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

;; org roam v2 
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  :bind (("<leader> n r l" . org-roam-buffer-toggle)
         ("<leader> n r f" . org-roam-node-find)
         ("<leader> n r g" . org-roam-graph)
         ("<leader> n r i" . org-roam-node-insert)
         ("<leader> n r c" . org-roam-capture)
         ;; Dailies
         ("<leader> n r j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(setq org-src-fontify-natively t)

