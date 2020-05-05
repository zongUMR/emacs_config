(use-package graphql
             :defer t
             :commands (lsp lsp-deferred)
             :init (
                    add-hook 'graphql-mode 'lsp-deferred
                    )
             :config
             )


(use-package graphql-mode
             :defer t
             :mode (("\\.graphql$" . graphql-mode))
             )
(provide 'pkg-graphql)
