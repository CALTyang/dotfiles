(package-initialize)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      dired+
		      evil-surround
		      window-numbering
		      evil-nerd-commenter
		      evil-leader
		      hungry-delete
		      aggressive-indent
		      helm-projectile
		      helm-directory
		      helm-ag
		      ace-jump-helm-line
		      evil
		      ace-window
		      neotree
		      company
		      vue-mode
		      helm
		      smex
		      popwin
		      switch-window
		      ace-jump-mode
		      ;; --- Major Mode ---
		      multi-term
		      js2-mode
		      ;; --- Minor Mode ---
		      emmet-mode
		      web-mode
		      exec-path-from-shell
		      ;; --- Themes ---
		      nyan-mode
		      monokai-theme
		      solarized-theme
		      helm-themes
		      powerline
		      powerline-evil
		      moe-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'init-packages)
