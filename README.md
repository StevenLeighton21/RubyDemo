# RubyDemo
Demonstration of basic Ruby OO programming

The task:

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views

     e.g.:
         /home 90 visits
         /index 80 visits
         etc...

  > list of webpages with most unique page views also ordered

     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...

Make sure you have `ruby` installed on the system. From the command line (at the top level of the project):
Run `gem install rspec`
Run tests with `rspec spec/*`
Run the script with `./parser.rb testdata/webserver.log`
