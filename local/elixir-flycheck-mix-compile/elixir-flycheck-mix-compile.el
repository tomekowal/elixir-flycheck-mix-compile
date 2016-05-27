;;; Code:
(require 'flycheck)

(flycheck-define-checker
 elixir-mix-compile
 "Defines a checker for elixir with mix compile"
 :command ("mix_compile_helper" source-original)
 :error-patterns
 ((warning line-start
            (file-name)
            ":"
            line
            ": warning: "
            (message)
            line-end)
   (error line-start
          "** ("
          (one-or-more word)
          "Error) "
          (file-name)
          ":"
          line
          ": "
          (message)
          line-end))
 :modes (elixir-mode))

;;;###autoload
(defun elixir-flycheck-mix-compile-setup ()
  "Setup Flycheck for Elixir."
  (add-to-list 'flycheck-checkers 'elixir-mix-compile))

(provide 'elixir-flycheck-mix-compile)
;;; flycheck-elixir-testresult.el ends here
