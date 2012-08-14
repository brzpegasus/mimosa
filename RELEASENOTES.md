# 0.0.19alpha - August, 13 2012
### Major Changes
* #16, can now use live reload on multiple directories.  Add an `additionaldirs` array to the `reloadOnChange` options hash with the paths to the other directories you'd like to watch.  `mimosa new` will now will now deliver code that will watch the `views` directory.

### Minor Changes
* #18, prematurely killing interval resulted in builds ending too soon, don't kill until the compilers are done
* #22, almond appearing and disappearing should no longer bother mimosa projects with huge numbers of files

### Breaking Changes
* For those using the server code delivered by Mimosa, the `reloadOnChange` options hash `exclude` now takes an array of RegExp strings rather than an array of regular strings.  Be sure to escape your regex.

# 0.0.18alpha - August, 12 2012
### Minor Changes
* #20, removing firefox debug info from stylus compiled files when optimized
* #!8, when throttling, build should now exit

# 0.0.17alpha - August, 11 2012
### Major Changes
* Added `watch.throttle` config setting to provide throttling for large number of adds.
* Added ability to handle `requirejs` global from require.js library.  Previously was just handling `require`.

### Minor Changes
* Added 'yaml' as another default copy extension

# 0.0.16alpha - August, 10 2012
### Minor Changes
* Fixed #17, when requirejs optimization throws, subsequent runs will not automatically also throw
* Mimosa will continue to recognize path directories from require config after a file has been deleted

# 0.0.15alpha - August, 9 2012
### Minor Changes
* Remove package.json on volo add
* added default npm/gitignore on project creation
* fixed problem with LESS base file determination
* added support for verifying shim paths

# 0.0.14alpha - August, 6 2012
### Minor Changes
* Fixed rushed version/publish
* fixed #12, handle path arrays/fallbacks

# 0.0.13alpha - August, 6 2012
### Minor Changes
* Fixed #8, recognize plugin path
* Fixed #11, validate plugin path itself
* bug on template delete

# 0.0.12alpha - August 5, 2012
### Major Changes
* RequireJS handling now manages and can correctly recognize your `map` config

### Minor Changes
* Many bug fixes in require path management

# 0.0.11alpha - August 2, 2012
### Major Changes
* Added plain html templating

### Minor Changes
* vendor compiled css and js won't be linted by default, like bootstrap's LESS.  Is fix, adhering to existing setting.
* update watch-connect
* 'require' is a valid dependency

# 0.0.10alpha - August 2, 2012
### Major Changes
* Added new command, `install` which will use volo to install dependencies from GitHub.

# 0.0.9alpha - August 1, 2012
### Major Changes
* Use calculated require dependency graph as input to optimization, removes need to provide any config whatsoever for vanilla r.js optimizes.
* Added ability to have multiple base require modules that will be auto-detected and individually optimized based on items their dependency tree being updated
* included requirejs path verification in straight js copies for files not in vendor

### Minor Changes
* added use of jade partial to version of initial add delivered when jade is selected
* write to the console when a non-vendor file is detected not wrapped in either require or define block
* write a warning to the console when a circular require dependency is detected

### Breaking Changes
* The entire optimize defaults section of the [mimosa-config](https://github.com/dbashford/mimosa/blob/master/lib/skeleton/mimosa-config.coffee) is now gone as Mimosa will figure it all out for you.  Anything provided inside the optimize setting will overwrite anything Mimosa calculates.

# 0.0.8alpha - July 30, 2012
### Major Changes
* added `jade` flag to `build` command that when provided will attempt to compile `index.jade`
* removed coffee-lint

### Minor Changes
* Upgraded Chokidar
* watch-connect back to npm

# 0.0.7alpha - July 28, 2012
### Major Changes
* Added `update` command to make it easy for people to keep their dependent post-new-command modules up to date with Mimosa's skeleton

# 0.0.6alpha - July 27, 2012
### Major Changes
* Added new RequireJS path verification ([see documentation](https://github.com/dbashford/mimosa#requirejs-support))

### Minor Changes
* Moved the require code around a bit in the Mimosa code base
* slightly altered the require code surrounding the client template libraries

### Breaking Changes
The `require` config has been broken up. What was previously directly under `require` is now under `require.optimize`.  A new `verify` option lives under the `require` config.

If you have not overridden any `require` configuration, then you are fine.  However, for future reference, it is suggested that you copy the new [mimosa-config.coffee](https://github.com/dbashford/mimosa/blob/master/lib/skeleton/mimosa-config.coffee) `require` block over top of yours.

If you have overridden the `require` configuration, then you'll want to adjust your current `require` object to be inside the `optimize` object, and you'll want to add the new `verify` option as it exists in the [mimosa-config.coffee](https://github.com/dbashford/mimosa/blob/master/lib/skeleton/mimosa-config.coffee).