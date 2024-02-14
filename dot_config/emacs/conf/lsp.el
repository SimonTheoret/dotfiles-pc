(defun dotfiles--lsp-deferred-if-supported ()
  "Run `lsp-deferred' if it's a supported mode."
  (unless (derived-mode-p 'emacs-lisp-mode)
    (lsp-deferred)))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python--tsmode)
         (python-ts-mode . lsp)
         (rustic-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp
  :general-config (general-def
		   'normal
		   "<leader> c d"   '( "Find definition" . lsp-find-definition)
		   "<leader> c a"   '( "Execute action" . lsp-execute-code-action)
		   "<leader> c i"   '( "Find implementation" . lsp-find-implementation)
		   "<leader> c t"   '( "Find type def" . lsp-find-type-definition)
		   "<leader> c D"   '( "Find declaration" . lsp-find-declaration)
		   "<leader> c k"   '( "Find declaration" . lsp-describe-thing-at-point)
		   "<leader> c r f" '( "Find reference" . lsp-ui-peek-find-references)
		   "<leader> c r r" '( "Rename" . lsp-rename	       )
		   "<leader> c w r" '( "LSP Workspace remove" . lsp-workspace-folders-remove)
		   "<leader> c w a" '( "LSP Workspace add" . lsp-workspace-folders-add)
		   )
  :config
  (lsp-modeline-code-actions-mode)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-modeline-diagnostics-scope :workspace))

(use-package all-the-icons)

;; optionally
;; By default, lsp-mode automatically activates lsp-ui unless lsp-auto-configure is set to nil.
(use-package lsp-ui :commands lsp-ui-mode )

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



;; Rust
(use-package rustic
  :init
  (setq-default lsp-rust-analyzer-cargo-watch-command "clippy")
  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer")))

