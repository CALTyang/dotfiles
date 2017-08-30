(package-initialize)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode hungry-delete aggressive-indent multi-term helm-projectile helm-themes helm-directory helm-ag ace-jump-helm-line solarized-theme powerline powerline-evil moe-theme evil ace-window neotree company vue-mode monokai-theme exec-path-from-shell helm smex nyan-mode popwin switch-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Configure Appearance
;;(load-theme 'monokai t)
(load-theme 'tango-dark t)
(require 'moe-theme)
;;(moe-dark )

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(delete-selection-mode t)
(setq make-backup-files nil)
(setq-default cursor-type 'bar)
(setq inhibit-startup-screen t)
(global-linum-mode 1)
;;(global-hl-line-mode 1)
(display-time-mode 1)
(setq initial-scratch-message "hello world : )")
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; configure siwtch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; configure popwin
(require 'popwin)
(popwin-mode 1)

;; configure nyan-mode
(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
      ))
(nyan-mode t)

;; configure Ace-jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; configure Smex
(require 'smex) 
(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Configure Helm
(require 'helm-config)
(require 'helm-themes)
(require 'helm-projectile)
(require 'ace-jump-helm-line)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-d") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c p h") 'helm-projectile)
(global-set-key (kbd "C-x r l") 'helm-bookmarks)
(helm-projectile-on)
;; Helm + Acejump
(eval-after-load "helm"
'(define-key helm-map (kbd "C-'") 'ace-jump-helm-line))
;; Helm + Appearance

(setq helm-M-x-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)


;; Solve $PATH Problem
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Configure Vue
;;(require 'vue-mode)

;; Configure Company
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;; Configure NEOtree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; Recent Files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Configure Evil
(require 'evil)
(evil-mode 1)

;; Configure Powerline
(require 'powerline)
;;(powerline-default-theme)
;;(powerline-center-evil-theme)
(powerline-vim-theme)
(require 'powerline-evil)

;; Configure Ace-Window
;;(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x C-o") 'ace-window)

;; Configure Multi-Term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)

;; Configure Hungry Delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Configure Indent
;;(require 'aggressive-indent)
;;electric-indent-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Configure Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

