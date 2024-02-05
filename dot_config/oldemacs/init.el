;; boostrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Don't show the splash screen
(setq inhibit-startup-message t)

;; Turn off some unneeded UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; font
;; (set-frame-font "JetBrainsMono Nerd Font Mono 100" nil t)
(set-face-attribute 'default t :font "JetBrainsMono Nerd Font Mono-10" )

;; Scrolling
(pixel-scroll-mode 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; electric
;; auto pair
(electric-pair-mode t)
(electric-indent-mode t)

;; hl line mode and blink cursor
(setq blink-cursor-mode	t)
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; Display relative line numbers in every buffer
(global-display-line-numbers-mode t)

(setq display-line-numbers-type 'relative)

;; Use-package magic!
(straight-use-package 'use-package)
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Smooth scrolling
(use-package smooth-scrolling
  :init
  (smooth-scrolling-mode 1))


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

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 15)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))


(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :after all-the-icons
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))


;; Generic keymaps
(evil-global-set-key 'normal (kbd "<leader> f") 'find-file)
(evil-global-set-key 'normal (kbd "<leader> c c") 'compile)
(evil-global-set-key 'normal (kbd "<leader> c r") 'recompile)
(evil-global-set-key 'normal (kbd "TAB") 'evil-jump-item) 

(evil-global-set-key 'normal (kbd "<leader> n l") #'org-store-link)
(evil-global-set-key 'normal (kbd "<leader> n a") #'org-agenda)
(evil-global-set-key 'normal (kbd "<leader> n c") #'org-capture)

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package diredfl
  :config
  (diredfl-global-mode))

(use-package dired-rsync
  :bind
  (:map dired-mode-map
              ("C-c C-r" . dired-rsync)))

(use-package dired-rsync-transient
  :bind
  (:map dired-mode-map
              ("C-c C-x" . dired-rsync-transient)))

;; magit
(use-package magit
  :after evil-collection
  :bind
  (("<leader> g /" . 'magit)))

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh) ;;compatibility with diff-hl
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh) ;;compatibility with diff-hl

;; persperctive
(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "<leader> TAB"))
  :init
  (persp-mode))

(use-package perspective-tabs
  :after (perspective)
  :straight (:host sourcehut :repo "woozong/perspective-tabs")
  :init
  (perspective-tabs-mode +1))


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

;; Treemacs
(use-package treemacs
  :bind
  (:map global-map
	("<leader> p o" . treemacs))
  :defer t)

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; LSP
(defun dotfiles--lsp-deferred-if-supported ()
  "Run `lsp-deferred' if it's a supported mode."
  (unless (derived-mode-p 'emacs-lisp-mode)
    (lsp-deferred)))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (prog-mode . dotfiles--lsp-deferred-if-supported)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp dotfiles--lsp-deferred-if-supported))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; LSP optimizations
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-use-plists t)

;; Company Completion
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Snippets
(use-package yasnippet
  :init
  (require 'yasnippet)
  (yas-global-mode 1))

(use-package doom-snippets
  :after yasnippet
  :straight (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*")))

;; cute aestethic plugin
(use-package solaire-mode
  :init
  (solaire-global-mode +1))

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

;; org evil 
(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
