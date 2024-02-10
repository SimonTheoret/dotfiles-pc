(defun dotfiles--lsp-deferred-if-supported ()
  "Run `lsp-deferred' if it's a supported mode."
  (unless (derived-mode-p 'emacs-lisp-mode)
    (lsp-deferred)))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python--tsmode)
         (python-ts-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp
  :general-config (general-def
		   'normal
		   "K" #'lsp-find-definition 
		   "g r" #'lsp-find-references
		   )
  :config
  (lsp-modeline-code-actions-mode)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-modeline-diagnostics-scope :workspace))

(use-package all-the-icons)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; LSP optimizations

(defun lsp-optim ()
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-use-plists t))

(add-hook 'lsp-mode 'lsp-optim )

;; Python

(use-package lsp-pyright
  :ensure t
  :hook (python-ts-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred


