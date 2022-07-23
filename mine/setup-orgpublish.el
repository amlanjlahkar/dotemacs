(require 'ox-publish)

(use-package htmlize
  :commands org-publish)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.css\" />"
      org-publish-project-alist
      (list
       (list "blogpost"
             :recursive t
             :base-directory "~/documents/blog_posts/drafts/"
             :publishing-directory "~/documents/blog_posts/published/"
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creator t
             :with-date t
             :section-numbers nil
             :time-stamp-file nil)))

(message "Build Complete!")

(provide 'setup-orgpublish)
