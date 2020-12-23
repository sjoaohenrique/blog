(require 'ox-publish)

(setq header-file "~/personal/jsouza-xyz/partials/header.html"
      footer-file "~/personal/jsouza-xyz/partials/footer.html")

(defun blog-header (arg)
  (with-temp-buffer
    (insert-file-contents header-file)
    (buffer-string)))

(defun blog-footer (arg)
  (with-temp-buffer
    (insert-file-contents footer-file)
    (buffer-string)))

(setq org-publish-project-alist
      '(("blog-notes"
         :base-directory "~/personal/jsouza-xyz/"
         :base-extension "org"
         :publishing-directory "~/personal/jsouza-xyz/public"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :html-head nil
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-preamble blog-header
         :html-postamble blog-footer
         :exclude "~/personal/jsouza-xyz/public")

         ("blog-static"
          :base-directory "~/personal/jsouza-xyz"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory "~/personal/jsouza-xyz/public"
          :recursive t
          :publishing-function org-publish-attachment
          :exclude "~/personal/jsouza-xyz/public")

         ("jsouza-xyz" :components ("blog-notes" "blog-static"))))
