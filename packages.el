;;; packages.el --- elixir-flycheck-mix-compile layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Tomasz Kowal <tomaszkowal@MacBook-Pro-Tomasz.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `elixir-flycheck-mix-compile-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `elixir-flycheck-mix-compile/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `elixir-flycheck-mix-compile/pre-init-PACKAGE' and/or
;;   `elixir-flycheck-mix-compile/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst elixir-flycheck-mix-compile-packages
  '(flycheck
    (elixir-flycheck-mix-compile :location local)))

(when (configuration-layer/layer-usedp 'syntax-checking)
  (defun elixir-flycheck-mix-compile/init-elixir-flycheck-mix-compile ()
    (autoload 'elixir-flycheck-mix-compile-setup "elixir-flycheck-mix-compile" "Setup Flycheck for Elixir" nil nil)
    (use-package elixir-flycheck-mix-compile
     :defer t
     :init (add-hook 'elixir-mode-hook 'elixir-flycheck-mix-compile-setup)))
  (defun elixir-flycheck-mix-compile/post-init-flycheck ()
    (add-hook 'elixir-mode-hook 'flycheck-mode)))

;;; packages.el ends here
