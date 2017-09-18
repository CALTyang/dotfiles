;; Configure Dired-Mode
(require 'dired+)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "C-<up>")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))
;; add new file key => c to dired mode
(define-key dired-mode-map "c" 'find-file)

;; Open recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'helm-recentf)

;; Configure hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Solve OSX $PATH Problem
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Configure Indent
;;(require 'aggressive-indent)
;;electric-indent-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Configure Multi-Term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)

;; Configure Tern
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'web-mode-hook 'tern-mode)

;; -------------------------------------------------- 
;; Configure Company
;; -------------------------------------------------- 
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
;; add company backends


;; -------------------------------------------------- 
;; Configure Evil
;; -------------------------------------------------- 
(require 'evil)
(evil-mode 1)
;; Configure Evil-Leader
(setq evil-leader/leader "SPC")
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

;; Configure Evil-Surround
(require 'evil-surround)
(global-evil-surround-mode 1)
(global-evil-leader-mode)

;; Configure Evil-Commenter
(define-key evil-normal-state-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines)

;; -------------------------------------------------- 
;; Configure Helm
;; -------------------------------------------------- 
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

;; Configure Helm fuzzy search
(setq helm-M-x-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)


;; -------------------------------------------------- 
;; Configure ace-jump
;; -------------------------------------------------- 
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; -------------------------------------------------- 
;; Configure Web-Mode
;; -------------------------------------------------- 
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; -------------------------------------------------- 
;; Configure Js2-Mode
;; -------------------------------------------------- 
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; -------------------------------------------------- 
;; Configure Magit
;; -------------------------------------------------- 
(require 'magit)
(require 'evil-magit)

;; Configure Evil-Leader Shortcuts
(evil-leader/set-key
  "gi" 'magit-init
  "gs" 'magit-status
  )


(provide 'init-better-edit)
