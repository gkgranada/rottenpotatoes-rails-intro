# RottenPotatoes demo app: getting started

This app is associated with the free [online
course](http://www.saas-class.org) and (non-free)
[ebook](http://www.saasbook.info) Engineering Software as a Service.

To get started:

0. In your terminal, type the following command to clone the repository to your development workspace:

  `git clone git@github.com:lgbanuelos/rottenpotatoes-rails-intro.git`

0. Then `cd rottenpotatoes-rails-intro` to change to the app's
directory.

0. Run the command `bundle install --without production` to make sure all the gems
(libraries) used by the app are in place.

0. **IMPORTANT:** If your are using a Windows box, you must replace the content of `config/database.yml` as we have done during the last lecture/practical (see https://bitbucket.org/lgbanuelos/asd-2016/wiki/Lecture5).

0. Run `bundle exec rake db:setup` to create the initial database.

0. Run `rails server` to start the app. As usually, you would be able to interact with your the running app using a browser pointing to the URL http://localhost:3000.
