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
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; configure Smex
(require 'smex) 
(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; Configure Vue
;;(require 'vue-mode)


;; Configure Evil
(evilnc-default-hotkeys)
(window-numbering-mode 1)

;; Configure Ace-Window
;;(global-set-key (kbd "C-x o") 'ace-window)
;;(global-set-key (kbd "C-x C-o") 'ace-window)



;; Configure Emmet
(require 'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

(put 'erase-buffer 'disabled nil)
