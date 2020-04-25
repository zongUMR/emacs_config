;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Web IDE Setup
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package emmet-mode)
(use-package web-mode
  :config
  (progn
    (defun pkg-web-mode-hook ()
      "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (setq web-mode-css-indent-offset 2))

    (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

    (add-hook 'web-mode-hook  'pkg-web-mode-hook)
    (setq tab-width 2)

    (add-hook 'web-mode-hook  'emmet-mode)))

(use-package prettier-js
  :ensure t
  :init
  (add-hook 'web-mode-hook 'prettier-js-mode)
  )

(provide 'pkg-web)
