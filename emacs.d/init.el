
;; Load Configuration Modules

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-edit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-leader/leader "SPC")
 '(package-selected-packages
   (quote
    (dired+ evil-surround window-numbering evil-nerd-commenter evil-leader emmet-mode web-mode hungry-delete aggressive-indent multi-term helm-projectile helm-themes helm-directory helm-ag ace-jump-helm-line solarized-theme powerline powerline-evil moe-theme evil ace-window neotree company vue-mode monokai-theme exec-path-from-shell helm smex nyan-mode popwin switch-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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


;; Configure Vue
;;(require 'vue-mode)


;; Configure Evil
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(global-evil-leader-mode)
;; Customize Evil-leader shortcuts
(evil-leader/set-key "e" 'find-file)
(evil-leader/set-key
  "ff" 'helm-find-files
  "fr" 'helm-recentf
  "fs" 'evil-save
  "fq" 'kill-buffer-and-window
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer-and-window
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  "hs" (lambda () (interactive)(split-window-vertically) (other-window 1))
  "vs" (lambda () (interactive)(split-window-horizontally) (other-window 1))
  "//" 'evilnc-comment-or-uncomment-lines
  "bl" 'helm-bookmarks
  "sf" 'toggle-frame-fullscreen
  "sm" 'toggle-frame-maximized
  "mt" 'multi-term
  )
(evilnc-default-hotkeys)
(window-numbering-mode 1)

;; Configure Evil-Commenter
;;(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;;(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; Configure Ace-Window
;;(global-set-key (kbd "C-x o") 'ace-window)
;;(global-set-key (kbd "C-x C-o") 'ace-window)

;; Configure Multi-Term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)

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

;; Configure Emmet
(require 'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

(put 'erase-buffer 'disabled nil)


