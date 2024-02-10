;; Elisp go def
(use-package elisp-def
  :hook
  ((hook . elisp-def-mode)))

(use-package highlight-quoted
  :hook
  (emacs-lisp-mode . highlight-quoted-mode))
;; (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
