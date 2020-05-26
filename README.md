JS.GIF - Javascript/GIF Polyglot
================================

This package produces a GIF that can also be executed as Javascript by a browser, when referenced in a `<script>` tag.

# Installation

## Prerequesites

* BBE - https://sourceforge.net/projects/bbe-/
* YASM - https://yasm.tortall.net/

## Build

    make
    make install DESTDIR=/tmp   # copy files to web server

# Notes

Most web servers perform content snooping, i.e., they sent a content type based on heuristics.  This needs to be defeated for `js.gif`, because browsers refuse to execute images.  E.g., in Apache2 `.htaccess`:

    <Files "js.gif">
    ForceType application/octet-stream
    </Files>

# References

* https://0x00sec.org/t/gif-javascript-polyglots-abusing-gifs-tags-and-mime-types-for-evil/5088
* Ange Albertini (original idea?)
