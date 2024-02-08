;; Keybindings
;; Future addition: (https://github.com/noctuid/general.el)

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
  :config
  ;; bind evil-args text objects
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

  ;; bind evil-forward/backward-args
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)


  ;; bind evil-jump-out-args
  (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(use-package evil-easymotion
  :after evil)

;; org evil 
(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; treemacs keybindings
(use-package treemacs-evil
  :after (treemacs evil))
;; Generic keymaps
(evil-global-set-key 'normal (kbd "<leader> f f") 'ido-find-file)
(evil-global-set-key 'normal (kbd "<leader> f p") 'search-emacs-dir )
(evil-global-set-key 'normal (kbd "<leader> c c") 'compile)
(evil-global-set-key 'normal (kbd "<leader> c r") 'recompile)
(evil-global-set-key 'normal (kbd "TAB") 'evil-jump-item) 

(evil-global-set-key 'normal (kbd "<leader> n l") #'org-store-link)
(evil-global-set-key 'normal (kbd "<leader> n a") #'org-agenda)
(evil-global-set-key 'normal (kbd "<leader> n c") #'org-capture)
(evil-global-set-key 'normal (kbd "<leader> s g") 'lgrep)


(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2))

(defun search-emacs-dir ()
  (interactive)
  (ido-find-file-in-dir user-emacs-directory))

;; combine evil join and evil fill and move
;; (defun join-and-fill ()
;;   (evil-join))
