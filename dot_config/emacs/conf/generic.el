;; Generic goodies

(setq inhibit-startup-message t)

;; Turn off some unneeded UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; font
;; (set-frame-font "JetBrainsMono Nerd Font Mono 100" nil t)
(add-to-list 'default-frame-alist
	     '(font . "FiraCode Nerd Font-10"))

;; Scrolling
(pixel-scroll-mode 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)


(setq blink-cursor-mode	t)
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; Display relative line numbers in every buffer
(global-display-line-numbers-mode t)

(setq display-line-numbers-type 'relative)

;; Electric defaults
(electric-pair-mode t)
(electric-indent-mode t)

;; Nice greek symbols
(global-prettify-symbols-mode)
