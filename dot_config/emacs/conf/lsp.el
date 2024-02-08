(defun dotfiles--lsp-deferred-if-supported ()
  "Run `lsp-deferred' if it's a supported mode."
  (unless (derived-mode-p 'emacs-lisp-mode)
    (lsp-deferred)))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp)

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (lsp-modeline-code-actions-mode)
  (lsp-headerline-breadcrumb-mode)
  (setq lsp-modeline-diagnostics-enable t
  (setq lsp-modeline-diagnostics-scope :workspace))


(use-package all-the-icons)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; LSP optimizations
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-use-plists t)

(evil-global-set-key 'normal (kbd "K") 'lsp-find-definition )
(evil-global-set-key 'normal (kbd "g r") 'lsp-find-references )

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
