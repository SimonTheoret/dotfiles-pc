;; -*- lexical-binding: t -*- 

(defun utils-update-cm-emacs ()
  "Update the chezmoi emacs files. It runs the following commands: -
`chezmoi add user-emacs-directory/*.el --force` -`chezmoi add
user-emacs-directory/conf/*.el --force`"
  (interactive)
  (let ((first-cmd-string
         (concat
          "chezmoi add " user-emacs-directory "*.el" " --force"))
        (second-cmd-string
         (concat
          "chezmoi add "
          user-emacs-directory
          "conf/*.el"
          " --force")))
    (setq async-shell-command-buffer "new-buffer")
    (async-shell-command first-cmd-string nil)
    (async-shell-command second-cmd-string nil)
    (setq async-shell-command-buffer "confirm-new-buffer")
    ))


;; new macro for updating a varialbe and switching it right after the
;; execution. Is it defadvice??

