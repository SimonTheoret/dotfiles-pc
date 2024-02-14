
(use-package pyvenv
  :hook
  (python-ts-mode . pyvenv-mode)
  (python-ts-mode . pyvenv-tracking-mode)
  ;; :config
  ;; (setq pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:" pyvenv-virtual-env-name "] ")))

  )

(use-package pip-requirements)


(use-package company-anaconda)
(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
