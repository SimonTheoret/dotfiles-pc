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
    (setq shell-command-buffer "new-buffer")
    (shell-command first-cmd-string nil)
    (shell-command second-cmd-string nil)
    (setq shell-command-buffer "confirm-new-buffer")
    ))
