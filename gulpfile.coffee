gulp = require('gulp')
$ = require('gulp-load-plugins')()

file = "./jquery.pursuingnav.coffee"

gulp.task 'connect', ->
  $.connect.server {
    root: './',
    livereload: true
  }

gulp.task 'coffee', ->
  gulp.src file
  .pipe $.coffee()
  .pipe $.uglify()
  .pipe gulp.dest './'

gulp.task 'watch', ['connect'], ->
  gulp.watch [file], ['coffee']

gulp.task 'default', ['watch']