;;; -*- lexical-binding: t; -*-


(use-package
 pyvenv
 :hook
 (python-ts-mode . pyvenv-mode)
 (python-ts-mode . pyvenv-tracking-mode)
 ;; :config
 ;; (setq pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:" pyvenv-virtual-env-name "] ")))
 )

(use-package
 auto-virtualenv
 :hook (python-ts-mode . auto-virtualenv-set-virtualenv)
 (projectile-after-switch-project . auto-virtualenv-set-virtualenv) ;; If using projectile
 )

(use-package pip-requirements)


(use-package company-anaconda)
(eval-after-load "company"
  '(add-to-list
    'company-backends '(company-anaconda :with company-capf)))

(use-package
 pipenv
 :hook (python-ts-mode . pipenv-mode)
 :init
 (setq pipenv-projectile-after-switch-function
       #'pipenv-projectile-after-switch-extended))
