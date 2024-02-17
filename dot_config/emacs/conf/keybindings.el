;; Keybindings

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-overrifing-maps nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)

  (evil-set-leader '(normal visual replace operator motion emacs ) (kbd "SPC")) ;; leader declaration
  (evil-set-leader nil (kbd "<leader> m") t)) ;; Local leader declaration

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-args
  :after evil
  :general-config
  (:states 'normal
	    "L" '("Next arg" . evil-forward-arg )
	    "H" '("Previous arg" . evil-backward-arg )
	    "K" '("Out of args" . evil-jump-out-args ))
  (:states 'motion
	    "L" '("Next arg" . evil-forward-arg )
	    "H" '("Previous arg" . evil-backward-arg )))

(use-package evil-easymotion
  :after evil)

(use-package evil-snipe
  :custom
  (evil-snipe-smart-case t)
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

;; org evil 
(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-magit)


(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2))

;; Generic keymaps

(general-def :states 'normal
  "<tab>" '("Jump pairs" . evil-jump-item)
  "TAB" '("Jump pairs" . evil-jump-item)
  "<leader> e b" '("eval buffer" . eval-buffer)
  "<leader> c c c" '("compile" . compile)
  "<leader> c c r" '("recompile" . recompile))

(general-def :states 'visual
  "<leader> e r" '("eval region" . eval-region))





;; combine evil join and evil fill and move
;; (defun join-and-fill ()
;;   (evil-join))
