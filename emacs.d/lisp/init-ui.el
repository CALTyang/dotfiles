;; Configure Editor Appearance

;; Default Config
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(delete-selection-mode t)
(setq make-backup-files nil)
(setq-default cursor-type 'bar)
(setq inhibit-startup-screen t)
(global-linum-mode 1)
(global-hl-line-mode 1)
(tool-bar-mode -1)
(display-time-mode 1)
(setq-default display-time-24hr-format t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq initial-scratch-message "hello world : )")
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Configure Theme
;;(load-theme 'monokai t)
(load-theme 'tango-dark t)
(require 'moe-theme)
;;(moe-dark )


;; configure siwtch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; configure popwin
(require 'popwin)
(popwin-mode 1)

;; Configure NEOTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; configure nyan-mode
(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
      ))
(nyan-mode t)

;; Configure Powerline
(require 'powerline)
;;(powerline-default-theme)
;;(powerline-center-evil-theme)
(powerline-vim-theme)
(require 'powerline-evil)

(provide 'init-ui)
