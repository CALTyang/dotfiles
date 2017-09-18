
;; Configure Evil-Org 
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional))
(setq evil-want-C-i-jump nil)


(provide 'init-org)
