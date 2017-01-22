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
    (mmm-mode vue-mode ido-yes-or-no popwin yasnippet web-mode emmet-mode undo-tree switch-window company relative-line-numbers nyan-mode monokai-theme ace-jump-mode helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; configure theme
(load-theme 'monokai t)
;; close welcome screen
(setq inhibit-startup-screen t)
;; change yes-no to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "M-x" ) 'helm-M-x)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; configure Nyan Mode
(nyan-mode t)
(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
       ))

;; configure linenumber
(global-relative-line-numbers-mode)

;; configure company-mode
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; configure switch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; hight current line
(global-hl-line-mode 1)

;; configure undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)

;; some ui configuration
(tool-bar-mode -1)

;; front-end
;; configure Emmet
(require 'emmet-mode)

;;configure web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; configure YASnippets
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "/Users/liuxiaoyang/Documents/Emacs/yasnippet-snippets")
(yas-global-mode 1)

;; configure popwin
(require 'popwin)
(popwin-mode 1)

;; cofigure ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; configure mmm-mode
(require 'mmm-mode)
