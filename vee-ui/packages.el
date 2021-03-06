;;; packages.el --- vee-ui layer packages file for Spacemacs.
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
;; added to `vee-ui-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vee-ui/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vee-ui/pre-init-PACKAGE' and/or
;;   `vee-ui/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vee-ui-packages
  '(emacs
    golden-ratio
    evil-snipe
    doom-modeline
    ace-jump-mode
    (mini-modeline :location (recipe :repo "kiennq/emacs-mini-modeline" :fetcher github))
    )
  "The list of Lisp packages required by the vee-ui layer.

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

(defun vee-ui/init-mini-modeline nil
  nil
  )

(defun vee-ui/post-init-doom-modeline nil
  (doom-modeline-mode 1))

(defun vee-ui/post-init-golden-ratio nil
  (require 'golden-ratio)
  (golden-ratio-mode 1))

(defun vee-ui/init-evil-snipe nil
  (evil-snipe-override-mode)
  (evil-global-set-key 'motion (kbd "g s") 'evil-snipe-s)
  (evil-global-set-key 'motion (kbd "g S") 'evil-snipe-S)
  )

(defun vee-ui/init-ace-jump-mode nil
  (evil-global-set-key 'motion (kbd "g L") 'evil-ace-jump-line-mode)
  (evil-global-set-key 'motion (kbd "g W") 'evil-ace-jump-word-mode)
  )

(defun vee-ui/init-emacs nil
  (toggle-truncate-lines -1)
  (fringe-mode 0)

  (setq-default
   truncate-lines t
   evil-shift-width 2
   )

  (evil-global-set-key 'motion (kbd "U") 'undo-tree-redo)
  (evil-global-set-key 'motion (kbd "s-h") 'evil-jump-backward)
  (evil-global-set-key 'motion (kbd "s-l") 'evil-jump-forward)
  (evil-global-set-key 'motion (kbd "s-j") 'spacemacs/evil-smart-goto-definition)
  (evil-global-set-key 'motion (kbd "s-k") 'spacemacs/evil-smart-doc-lookup)

  (evil-global-set-key 'motion (kbd "Q") 'kill-this-buffer)
  (evil-leader/set-key (kbd "b #") 'server-edit)

  (evil-global-set-key 'motion (kbd "H-/") 'helm-multi-swoop-all)
  (evil-global-set-key 'motion (kbd "H-]") 'evil-jump-forward)
  (evil-global-set-key 'motion (kbd "H-[") 'evil-jump-backward)
  (evil-global-set-key 'motion (kbd "H-b") 'dumb-jump-go)
  (evil-global-set-key 'motion (kbd "<backtab>") 'dumb-jump-quick-look)
  (evil-global-set-key 'insert (kbd "<backtab>") 'company-complete-common-or-cycle)
  (evil-global-set-key 'replace (kbd "<backtab>") 'company-complete-common-or-cycle)
  )


;;; packages.el ends here
