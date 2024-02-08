;; Makes emacs write code in my place

;; Company Completion
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idlle-delay 0.2))
  ;; (evil-global-set-key 'insert (kbd "TAB") 'company-select-next)
  ;; (evil-global-set-key 'insert (kbd "S-TAB") 'company-select-previous)
  ;; (evil-global-set-key 'insert (kbd "C-RET") 'company-complete-common))

(with-eval-after-load 'company
  (define-key company-active-map
              (kbd "TAB")
              #'company-complete-common-or-cycle)
  (define-key company-active-map
              (kbd "<backtab>")
              (lambda ()
                (interactive)
                (company-complete-common-or-cycle -1))))
;; Snippets
(use-package yasnippet
  :init
  (require 'yasnippet)
  (yas-global-mode 1)
  :config
  (evil-global-set-key 'normal (kbd "<leader> i s") 'yas-insert-snippet))

(use-package doom-snippets
  :after yasnippet
  :straight (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*")))
