'use strict';
 
var gulp          = require('gulp');
var sass          = require('gulp-sass');
var gulpWatch     = require('gulp-watch');
var concat        = require('gulp-concat');
var browserify    = require('gulp-browserify');
const tsc         = require("gulp-typescript");
const sourcemaps  = require('gulp-sourcemaps');
const tslint      = require('gulp-tslint');
const del         = require("del");
const tsProject   = tsc.createProject("tsconfig.json");

var runSequence   = require('run-sequence');
var argv          = require( 'argv' );

//development || production: sempre FALSE!
var isProduction = (argv.production === undefined) ? false : true;

/**
 * Remove build directory.
 */
gulp.task('clean', function(){
  console.log("Clean ...");
  return del('build');
});

/**
 * Compile TypeScript sources and create sourcemaps in build directory.
 */
var paths = {
  scripts: [["app/**/*.js", "app/*.js", "!**/*.ts"]], //gulp.src(paths.scripts)
  images: ''                                          //gulp.src(paths.images)
};

/**
 * Copy all resources that are not TypeScript files into build directory.
 */
gulp.task("resourcesSrc", () => {
    return gulp.src(["src/**/*"])
        .pipe(gulp.dest("build"))
});
gulp.task("resourcesJs", () => {
    return gulp.src(["app/**/*.js", "app/*.js", "!**/*.ts"])
        //.pipe(concat('all.js'))
        .pipe(gulp.dest("build/js"))
});
gulp.task("resourcesCss", () => {
    return gulp.src(["app/**/*.css", "!**/*.scss"])
        .pipe(concat('all.css'))
        .pipe(gulp.dest("build/css"))
});
gulp.task("resourcesHtml", () => {
    return gulp.src(["app/**/*.php"])
        .pipe(gulp.dest("build/app"))
});
/**
 * Assets
 */
gulp.task("assetsJs", () => {
    return gulp.src(["assets/js/**/*.js"])
        //.pipe(concat('assets.js'))
        .pipe(gulp.dest("build/js"))
});
gulp.task("assetsCss", () => {
    return gulp.src(["assets/css/**/*.css"])
        //.pipe(concat('assets.css'))
        .pipe(gulp.dest("build/css"))
});
gulp.task("assetsImages", () => {
    return gulp.src(["assets/images/**/*"])
        .pipe(gulp.dest("build/images"))
});
gulp.task("assetsFonts", () => {
    return gulp.src(["assets/fonts/**/*"])
        .pipe(gulp.dest("build/fonts"))
});
gulp.task('resources', ['resourcesSrc', 'resourcesJs', 'resourcesCss', 'resourcesHtml']);
gulp.task('assets', ['assetsJs', 'assetsCss', 'assetsImages', 'assetsFonts']);
/**
 * Copy all required libraries into build directory.
 */
gulp.task("libs", () => {
    return gulp.src([
            'node_modules/core-js/client/shim.min.js',
            'node_modules/zone.js/dist/zone.js',
            'node_modules/reflect-metadata/Reflect.js',
            'node_modules/systemjs/dist/system.src.js',
            'node_modules/rxjs/bundles/Rx.umd.js',
            'node_modules/@angular/core/bundles/core.umd.js',
            'node_modules/@angular/common/bundles/common.umd.js',
            'node_modules/@angular/compiler/bundles/compiler.umd.js',
            'node_modules/@angular/platform-browser/bundles/platform-browser.umd.js',
            'node_modules/@angular/platform-browser-dynamic/bundles/platform-browser-dynamic.umd.js'
        ])
        .pipe(gulp.dest("build/js/lib"));
});
gulp.task("libsrxjs", () => {
    return gulp.src(['node_modules/rxjs/**/*'])
        .pipe(gulp.dest("build/js/lib/rxjs"));
});

gulp.task("wordpress", () => {
    return gulp.src(['build/**/*'])
        .pipe(gulp.dest("CMS/wp-content/themes/html5blank-stable"));
});
/**
 * Build the project.
 */
/*
gulp.task("build", ['compile', 'resources', 'libs'], () => {
    console.log("Building the project ...")
});
*/
gulp.task('build', ['clean'], function(done){
  console.log("Build ... "+isProduction);
  runSequence(
    ['compileTs', 'compileSass', 'resources', 'assets', 'libs', 'libsrxjs'],
    function(){
      browserify({
        minify: isProduction,
        browserifyOptions: {
          debug: !isProduction
        },
        uglifyOptions: {
          mangle: false,
          compress: true
        }
      }).on('end', done);
    }
  );
});

/**
 * Sass o Scss files in CSS files
 */ 
gulp.task('compileSass', function () {
  return gulp.src('./app/**/*.scss')
    .pipe(sass.sync().on('error', sass.logError))
    .pipe(gulp.dest('./build/css'));
});
 
gulp.task('compileSass:watch', function () {
  gulp.watch('./app/**/*.scss', ['compileSass']);
});

/**
 * TS files in JS files
 */ 
gulp.task('compileTs', function () {
  return gulp.src('./app/**/*.ts')
    .pipe(sourcemaps.init())
    .pipe(tsc(tsProject))
    .pipe(gulp.dest('./build/js'));
});
 
gulp.task('compileTs:watch', function () {
  gulp.watch('./app/**/*.ts', ['compileTs']);
});