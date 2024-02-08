;; useful plugin

;; Tree-sitter
(use-package tree-sitter
  :init
  (require 'tree-sitter))

(use-package tree-sitter-langs
  :after tree-sitter)

;; (treesit-install-language-grammar 'rust)
;; (treesit-install-language-grammar 'go)
;; (treesit-install-language-grammar 'python)

;; (setq major-mode-remap-alist
;;   '((python-mode  . python-ts-mode))
;;     ;; (rust-mode . rust-ts-mode)
;;     ;; (go-mode . go-ts-mode)))

;; (global-tree-sitter-mode)
;; (tree-sitter-hl-mode)
