;; Makes emacs good looking

;; Smooth scrolling
(use-package smooth-scrolling
  :init
  (smooth-scrolling-mode 1))

;; Theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-molokai-sick t)

  ;; Enable flashing mode-line on errors
  ;; (doom-themes-visual-bell-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-molokai-sick") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :init
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))

(use-package all-the-icons-dired
  :after all-the-icons
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; THe essential modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

;; Noice splash screen
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))


;; cute aestethic plugin
(use-package solaire-mode
  :init
  (solaire-global-mode +1))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
