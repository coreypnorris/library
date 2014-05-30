##Library

####This is a library catalog program built using Ruby with  PSQL on the back end.

To use this program you'll need Ruby and PSQL installed on your machine. [Here's a link to help you install Ruby](http://www.learnhowtoprogram.com/lessons/installing-ruby) and [here's a link to help you install Postgres](http://www.learnhowtoprogram.com/lessons/installing-postgres). When you have Ruby and Postres installed, open postgres in your terminal and enter the following commands.

* create database library;
* \c library
* CREATE TABLE books (id serial PRIMARY KEY, name varchar, title_id integer, author_id integer);
* CREATE TABLE titles (id serial PRIMARY KEY, name varchar);
* CREATE TABLE authors (id serial PRIMARY KEY, name varchar);
* CREATE DATABASE library_test WITH TEMPLATE library;

Finally, download the zip file and navigate to the file in your terminal. Then run `ruby library.rb` to bring up the user interface.

We built this project while we were students at [Epicodus](http://www.epicodus.com/). [This exercise](http://www.learnhowtoprogram.com/lessons/library) was meant to introduce us to using SQL databases in our Ruby programs.
