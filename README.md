## linux-kernel-coding-style

> THIS PROJECT IS UNDER DEVELOPMENT, after all things done, I'll push it to melpa

[Linux Kernel Coding Style](https://github.com/torvalds/linux/blob/master/Documentation/process/coding-style.rst) for emacs.

---
[![License GPLv2](https://img.shields.io/badge/license-GPL_v2-green.svg)](http://www.gnu.org/licenses/gpl-2.0.html)
[![MELPA](http://melpa.org/packages/linux-kernel-coding-style-badge.svg)](http://melpa.org/#/linux-kernel-coding-style)
[![MELPA Stable](http://stable.melpa.org/packages/linux-kernel-cofing-style-badge.svg)](http://stable.melpa.org/#/linux-kernel-coding-style)

### About

I always wonder why thre's no any officialy *linux kernel coding style* implementation in emacs, the *linux* style defined in *cc-styles.el* are not the suitable style for editing linux kernel.

This plugin is based on [Linux Kernel Coding Style](https://github.com/torvalds/linux/blob/master/Documentation/process/coding-style.rst) documentation, some of codes are taken from [9: You've mad a mess of it](https://github.com/torvalds/linux/blob/master/Documentation/process/coding-style.rst#9-youve-made-a-mess-of-it).

Hope we can really has an easy setup for linux kernel development on Emacs :)

### Installation

If you have `melpa` and `emacs24` installed, simply type:

    M-x package-install linux-kernel-coding-style

And add the following to your .emacs

    (require 'linux-kernel-coding-style)
