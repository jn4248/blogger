# blogger
Simple blog created with Ruby on Rails as a "first project" (guide: The Odin Project)

If there are no users/authors currently in the database, the first login attempt will redirect to a new user creation screen.  Once one user account has been created, only logged in users can create additional user accounts.  Logged in users are also granted access to other additional features, such as editing accounts and articles, deleting articles and comments, resetting the number of article views to zero, and the Authors List (index) which allows for editing and deletion of users/authors.

Photos obtained via www.freephotos.cc/


Notable project features:

o Articles index is sortable by either date created, or by number of views (both ascending and descending).

o Top 3 articles, by views, is displayed in the left sidebar on all pages.  It is automatically updated whenever an article is viewed.  

o Page counting is updated during the Article#show action, but by calling an Article class method (in model). However, it updates on any call to show, whether it is a fresh page visit, a refresh of the page, via the browser back arrow, or by "canceling" an attempt to edit the article.

o For testing purposes (eg, to test initial creation of articles, and counting their views), there are two "reset" methods to bring the Article number of views back to zero. On the Article#index, you can reset ALL articles back to zero views.  From the Article#show page, you can reset the specific article back to zero.  Both methods redirect back to the Article Index, to avoid the 'show' action adding another "view count," which would alter the reset number to 1 instead of zero.  This feature is only available to logged on authors.

 o For testing purposes, (eg, to test adding the first author/user and available features), there is a "delete ALL Authors" feature on the Authors Index page.  This will remove all authors, and redirect to the Articles Index page.  From there you can create a new author account, as the "first" user. This feature is only available to logged on authors.

 o If there are no author accounts, after creating the first author account, you are redirected to the login screen.  Because successive new accounts can only be created by logged in users, creating new accounts is then redirected back to the Authors Index page, with a confirmation notice.

 Other ideas explored above project instructions:
 Member and Collection resources in config/routes. Application level method in Application Controller.  Class methods in Article Model. A private Set_Author method was created by scaffolding in creating the Author Class (to use in the RESTful methods, instead of repeating @author = Author.find(params[:id])" throughout...expanded this to other classes as well.
