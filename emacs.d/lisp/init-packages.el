(package-initialize)

(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
          company-web
          company-tern
          tern
		      ;; --- Better Editor ---
		      dired+
		      evil-surround
		      window-numbering
		      hungry-delete
		      aggressive-indent
		      ace-jump-helm-line
		      ace-window
		      neotree
		      company
		      smex
		      popwin
		      switch-window
		      ace-jump-mode
          editorconfig
		      ;; --- Evil ---
		      evil
		      evil-leader
		      evil-nerd-commenter
          evil-org
		      ;; --- Helm ---
		      helm
		      helm-ag
		      helm-directory
		      helm-projectile
		      ;; --- Major Mode ---
		      multi-term
		      js2-mode
          js2-refactor
		      ;; --- Minor Mode ---
		      emmet-mode
		      web-mode
		      vue-mode
		      exec-path-from-shell
          magit
          evil-magit
		      ;; --- Themes ---
		      monokai-theme
		      solarized-theme
		      helm-themes
		      moe-theme
		      nyan-mode
		      powerline
		      powerline-evil
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
