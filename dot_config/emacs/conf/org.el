;;;;;;;;; org-mode ;;;;;;;;

;; org-mode prettify
;; (use-package org-superstar
;;   :init
;;   (require 'org-superstar)
;;   :hook
;;   (org-mode . (lambda () (org-superstar-mode 1))))

;; (use-package org-fancy-priorities
;;   :hook
;;   (org-mode . org-fancy-priorities-mode)
;;   :config
;;   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(use-package org-modern
  :after org
  :hook
  ((org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda)))

;; Prettify windows. Should be in looks.el ?
;; (modify-all-frames-parameters
;;  '((right-divider-width . 40)
;;    (internal-border-width . 40)))
;; (dolist (face '(window-divider
;;                 window-divider-first-pixel
;;                 window-divider-last-pixel))
;;   (face-spec-reset-face face)
;;   (set-face-foreground face (face-attribute 'default :background)))
;; (set-face-background 'fringe (face-attribute 'default :background))

(setq
 ;; Edit settings
 org-return-follows-link t
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 ;;org-ellipsis "…"
 org-ellipsis " "

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◀── now ─────────────────────────────────────────────────")

;; Pretty indenting
(add-hook 'org-mode-hook 'org-indent-mode)

		 

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

;; Org mode starts folded
(setq org-hide-block-startup t)
(setq org-startup-folded t) ;; sets folding to overview (by setting t)

