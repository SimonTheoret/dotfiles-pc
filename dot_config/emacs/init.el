; loading function
(defun config-load-file-no-extension (content)
  "Loads and runs the file contained in the directory user-emacs-directory/conf"
  (let ((path (concat user-emacs-directory "conf/" content ".el")))
    (load(locate-user-emacs-file path))))

;; Immediate loading
(add-to-list 'load-path (concat user-emacs-directory "conf/"))
;;--------- Does not require packages.el -----------;;
(config-load-file-no-extension "generic") 
(load (locate-user-emacs-file "packages.el"))

;;--------- Does require packages.el -----------;;
(config-load-file-no-extension "keybindings") 
(config-load-file-no-extension "looks") 
(config-load-file-no-extension "completion") 
(config-load-file-no-extension "diredup") 
(config-load-file-no-extension "search") 
(config-load-file-no-extension "org") 
(config-load-file-no-extension "lsp") 
(config-load-file-no-extension "dap") 
(config-load-file-no-extension "treemacs") 
(config-load-file-no-extension "treesitter") 
(config-load-file-no-extension "emacslisp") 
(config-load-file-no-extension "views") 
(config-load-file-no-extension "projectsman") 



