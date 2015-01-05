(require 'popwin-term)
(popwin-mode 1)

(setq display-buffer-function 'popwin:display-buffer)
(push '(magit-status-mode :regexp t :position :bottom :height 16 :dedicated t) popwin:special-display-config)
(push '(term-mode :position :top :height 16 :dedicated t) popwin:special-display-config)
(push '(" *undo-tree*" :width 0.3 :position right :dedicated t) popwin:special-display-config)
