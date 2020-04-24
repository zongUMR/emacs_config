;; own config
;;自动清除行位空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'pkg-custom)
