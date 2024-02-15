(use-package flycheck
  :hook
  (after-init . global-flycheck-mode)) 

(use-package consult-lsp
  :general
  (general-def
    'normal
    "<leader> c l" '("List diagnostics" . consult-lsp-diagnostics)
    "<leader> s i" '("Search symbols in workspace" . consult-lsp-symbols)
    "<leader> s j" '("Search symbol in file" . consult-lsp-file-symbols)
    ))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-highlighting-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
