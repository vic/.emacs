;;; packages.el --- vee-dash layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: vic <vic@mjolnir>
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
;; added to `vee-dash-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vee-dash/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vee-dash/pre-init-PACKAGE' and/or
;;   `vee-dash/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vee-dash-packages
  '(counsel-dash)
  "The list of Lisp packages required by the vee-dash layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun vee-dash/pre-init-counsel-dash nil
  (spacemacs|use-package-add-hook counsel-dash
    :commands (counsel-dash)
    :init
    (evil-leader/set-key (kbd "d h") 'counsel-dash)
    :config
    (setq-default counsel-dash-docsets-path (expand-file-name "~/.docsets")
                  counsel-dash-common-docsets '()
                  counsel-dash-browser-func 'browse-url
                  )
    (add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
    (add-hook 'elixir-mode-hook (lambda () (setq-local counsel-dash-docsets '("Elixir"))))
    (add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 2"))))
    ))

;;; packages.el ends here
