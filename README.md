# IDL language support in Atom

## Introduction

This package provides support for
[IDL®](http://www.exelisvis.com/language/en-us/productsservices/idl.aspx),
[PV-WAVE](http://www.roguewave.com/products/pv-wave-family.aspx) and
[GNU Data Language (GDL)](http://gnudatalanguage.sourceforge.net).

This package (especially the highlighting of built-ins) is based on the
documentation for IDL 7.0.

## Current Support

Currently this package supports highlighting for

* Comments
* Numerical constants
* String constants
* Some operators (`AND` etc.)
* System variables
* Statement labels (as in `GOTO, fail`).
* Reserved words and control flow statements (`IF ... THEN` etc.).
* Built-in procedures and functions.
  * CDF and NetCDF functions are included.
  * Other scientific data formats still to be added.

## Future Development

* Scientific data format built-ins (`HDF`, `H5`, `EOS`).
* Automatic indentation.

## Disclaimers

* IDL is a registered trademark of [Exelis Visual Information Solutions](http://www.exelisvis.com).
* PV-WAVE is a product of [Rogue Wave Software](http://www.roguewave.com).
