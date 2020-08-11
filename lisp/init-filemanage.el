(use-package neotree
  :ensure t
  :init (setq neo-window-fixed-size nil
	      neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind (("<f8>" . neotree-toggle)))
