(add-to-list 'load-path "~/.emacs.d/site-lisp/muse")
(require 'muse-mode)
(require 'muse-html)
(require 'muse-wiki)
(setq muse-colors-inline-images nil)
(add-hook 'muse-mode-hook 'my-muse-mode-hook)
(defun my-muse-mode-hook ()
  (flyspell-mode 1))

(muse-derive-style "homepage-html" "html"
                   :header "~/projects/homepage/header.tmpl"
                   :footer "~/projects/homepage/footer.tmpl")

(setq muse-project-alist
	  `(("homepage"
         (,@(muse-project-alist-dirs"~/projects/homepage") :default "index")
         ,@(muse-project-alist-styles "~/projects/homepage"
                                      "~/projects/homepage"
                                      "homepage-html"))))

(setq homepage-menu '(("index.html" "Главная")
					  ("instead/" "Instead")
					  ("idec/" "IDEC")
					  ("music/" "Музыка")))

(defun muse-hp-generate-menu ()
  (let ((value "<ul id='menu'>")
		(cur-path-html (replace-regexp-in-string "\\.muse" ".html" (muse-current-file)))
		(rel-dir (file-name-directory (muse-wiki-resolve-project-page (muse-project)))))
	(dolist (item homepage-menu)
	  (setq value
			(concat value
					"<li><a ' href='" rel-dir (first item)
					"' class='item"
					(if (or
						 (and
						  (string-equal (first item) "index.html")
						  (not rel-dir))
						 (string-suffix-p (concat "/" (first item) "index.html") cur-path-html))
						" current")
					"'>"
					(second item)
					"</a></li>"
					(string ?\n))))
	(setq value (concat value "</ul>"))
	value))

(defun generate-change-date (file)
  (when (file-exists-p file)
    (let* ((fa (file-attributes file))
           (mod-time (nth 6 fa)))
      (format-time-string "%d.%m.%Y %R" mod-time))))

(defun muse-gen-relative-name (name)
  (concat
   (file-name-directory (muse-wiki-resolve-project-page (muse-project)))
   name))
