;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;;
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
(setq doom-theme 'doom-molokai-sick)
;;
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type 'relative)
;;
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/agenda"))
;;
;; Set delay forshowing the which-key and commands
(after! which-key
  (setq which-key-idle-delay 0.5))
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (After! PACKAGE
;;     (setq x y))
;;
;; ----- Setting up Org Mode -----
(after! org

  (setq org-capture-templates nil)

  (add-to-list 'org-capture-templates '("r" "Évènements récurrents"
                                        plain (file+headline "~/org/agenda/agenda.org" "Évènements récurrents")
                                        "** %?%(org-insert-time-stamp nil nil nil nil nil \" +1w\")"))

  (add-to-list 'org-capture-templates '( "u" "Évènements uniques" plain (file+headline
                                                                         "~/org/agenda/agenda.org" "Évènements uniques") "** %?%^T" ))

  (add-to-list 'org-capture-templates '( "t" "Tâches uniques" plain (file+headline
                                                                     "~/org/agenda/agenda.org" "Tâches uniques") "** TODO %? DEADLINE: %^T" ))
  (add-to-list 'org-capture-templates '( "g" "Tâches récurrentes" plain
                                         (file+headline "~/org/agenda/agenda.org" "Tâches récurrentes") "** TODO %? DEADLINE: %(org-insert-time-stamp nil nil nil nil nil \" +1w\")" ))

  (add-to-list 'org-capture-templates '( "e" "École" plain (file+headline
                                                            "~/org/agenda/agenda.org" "École") "** TODO %? DEADLINE: %^t :école:"))

  (add-to-list 'org-capture-templates '( "i" "Inbox" plain (file+headline
                                                            "~/org/todo.org" "Inbox") "** TODO %?" ))

  (add-to-list 'org-capture-templates '( "c" "Tâche contextuelles" plain (file+headline
                                                                          "~/org/agenda/agenda.org" "Tâches contextuelles") "** %?" ))

  (add-to-list 'org-capture-templates '( "a" "Tâches en attentes" plain (file+headline
                                                                         "~/org/agenda/agenda.org" "Tâches en attentes") "** %?" ))

  (add-to-list 'org-capture-templates '( "p" "Projets" plain (file+headline
                                                              "~/org/agenda/agenda.org" "Projets") "** %?" ))

  (defun org-summary-todo (n-done n-not-done) "Switch entry to DONE when all subentries
  are done, to TODO otherwise."  (let (org-log-done org-log-states)   ; turn off
                                   logging (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

                                        ; Auto line wrap (genre?)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  ;; ----- Setting org-roam -----
  (setq org-roam-directory "~/org/roam/")

  (setq org-hide-emphasis-markers t)

  )

;; ----- Line wraps in diagnostic -----
(after! lsp-ui
  (setq lsp-ui-sideline-diagnostic-max-lines 2)
  (lsp-signature-mode t)
  (setq lsp-lens-enable t)
  (setq lsp-headerline-breadcrumb-enable nil)
  )

;; ----- Cursor -----
(setq-default cursor-type 'bar)


;; ----- HACK: Can launch org-capture from the agenda -----

(after! org
  (defadvice! dan/org-capture-prevent-restart (fn &rest args)
    :around #'+org--restart-mode-h
    (unless (bound-and-true-p org-capture-mode)
      (apply fn args)))
  (add-hook! 'org-capture-after-finalize-hook
    (let ((buffer (org-capture-get :buffer)))
      (when (buffer-live-p buffer)
        (with-current-buffer buffer
          (+org--restart-mode-h))))))

;; ----- Which key config-----
;; Display correctly the last line of which-key popup
(defadvice! fix-which-key--show-popup (fn act-popup-dim)
  :around #'which-key--show-popup
  (let ((height (car act-popup-dim))
        (width  (cdr act-popup-dim)))
    (funcall fn (cons (+ height 1) width))))

;; ----- Adding path completion to company  -----
(add-to-list '+lsp-company-backends 'company-files)

;; Font increment for doom
(after! doom (setq doom-font-increment 1))
;; Default web browser
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "google-chrome-stable")

;; ----- Setting up C/C++ lsp clangd -----
(setq lsp-clients-clangd-args '("-j=3"
				"--background-index"
				"--clang-tidy"
				"--completion-style=detailed"
				"--header-insertion=never"
				"--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(setq display-line-numbers-type nil)

;; ----- Setting up go lsp (gopls) -----
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(setq lsp-go-hover-kind "FullDocumentation")

;; ----- Latex configuration -----
(setq +latex-viewers '(zathura))

;; ----- Remove $HOME as a project -----
(after! projectile (setq projectile-project-root-files-bottom-up (remove ".git"
                                                                         projectile-project-root-files-bottom-up))
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching 'nil))



;; Disable spell-fu and writegood by default
;; (remove-hook 'text-mode-hook #'flyspell-mode)
(remove-hook 'org-mode-hook #'writegood-mode)

;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; ----- Keybindings -----
(map! :leader :desc "Change dict" :n "icd" #'ispell-change-dictionary)
(map! :leader :desc "writegood toogle" :ni "t a" #'writegood-mode)
(map! :leader :desc "avy" :ni "t a" #'writegood-mode)
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
