
;; Dired open file in one buffer
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


(provide 'init-better-edit)
