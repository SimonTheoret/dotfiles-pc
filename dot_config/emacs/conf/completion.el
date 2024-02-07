;; Makes emacs write code in my place

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
