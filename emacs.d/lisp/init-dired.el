
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


(diredp-toggle-find-file-reuse-dir 1)

(provide 'init-dired)
