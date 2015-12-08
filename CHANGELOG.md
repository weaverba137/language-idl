# Changes

## 0.3.1 - FOREACH (unreleased)

* Added highlighting of `FOREACH` (PR #4).
* Ignore JavaScript files compiled from CoffeeScript.
* Add more tests.

## 0.3.0 - Switches and Other Infrastructure.

* Highlight function and procedure switches, *e.g.*, `MESSAGE, 'Hello!', /INFORMATIONAL`.
* Start adding snippets.
* Add spec tests.

## 0.2.0 - Deprecated Directory

* Store package settings in `settings/` instead of `scoped-properties/`.
* Update package.json file.
* Due to some minor confusion, there was no 0.1.0 official release. Tags v0.1.0 and v0.2.0 are identical.

## 0.0.8 - Indentation

* Add some basic support for auto-indent.

## 0.0.7 - More Functions and Procedures

* Add more functions and procedures.
* More carefully match name boundaries.
* Update README.
* Add label highlighting.

## 0.0.6 - More Functions and Procedures

* Add more functions and procedures.
* Identify logical operators: `&&`, `||`, `~`.

## 0.0.5 - Keywords

* Identify IDL reserved words & some of the operators.
* Identify system variables (like `!DPI`).
* More carefully identify (some!) built-in functions & procedures.

## 0.0.4 - Functions and Procedures

* Try to identify functions and procedures.  Don't try to distinguish
  built-ins at this point.

## 0.0.3 - Strings

* Add highlighting of strings. It's pretty basic at this point.  There could
  well be exotic cases where it doesn't work.

## 0.0.2 - Numbers

* Add highlighting of numerical constants.

## 0.0.1 - First Release

* Just trying to get comments working.
