---
title: Quantum GIS Development Setup
layout: note
---

This is my log of following [the Quantum GIS development installation notes](https://raw.github.com/qgis/Quantum-GIS/master/INSTALL).

I'm developing on a Mac running OS X Lion. This means my built-in version of Python is 2.7.

My iMac is a 3.4 GHz Intel Core i7 so:

    $ system_profiler | grep Cores
          Total Number of Cores: 4

    $ system_profiler | grep Processors
          Number of Processors: 1

From [How can I get CPU count and total RAM from the OS X command line?](http://serverfault.com/a/113253)

Which means when running `make` I can do:

    $ make -j 4

## Setting Up Dependencies

### Qt 4.8.0

Download and install Qt 4.8.0 from [http://get.qt.nokia.com/qt/source/qt-mac-opensource-4.8.0.dmg](http://get.qt.nokia.com/qt/source/qt-mac-opensource-4.8.0.dmg).

### Development Frameworks for QGIS Dependencies

Install the Frameworks listed at [Unix Compatability Frameworks](http://www.kyngchaos.com/software/frameworks).

### Additional Dependencies

I make a working directory in my home directory to download, compile and install additional dependencies.

    $ cd ~/
    $ mkdir qgis-prep
    $ cd qgis-prep/

#### Expat

I'm on Lion, so I don't need to install expat.

#### SIP

    $ curl -C - -O http://www.riverbankcomputing.com/static/Downloads/sip4/sip-4.13.2.tar.gz
    $ tar -zxvf sip-4.13.2.tar.gz 
    $ python2.7 configure.py -n -d /Library/Python/2.7/site-packages -b /usr/local/bin -e /usr/local/include -v /usr/local/share/sip --arch=x86_64 -s MacOSX10.7.sdk
    $ make -j 4
    $ sudo make install
    $ cd ..

#### PyQt4

    $ curl -C - -O http://www.riverbankcomputing.com/static/Downloads/PyQt4/PyQt-mac-gpl-4.9.1.tar.gz
    $ tar -zxvf PyQt-mac-gpl-4.9.1.tar.gz 
    $ cd PyQt-mac-gpl-4.9.1
    $ python2.7 configure.py -d /Library/Python/2.7/site-packages -b /usr/local/bin --use-arch x86_64
    $ vim pyqtconfig.py
          'qt_dir':            '/usr',
    $ make -j 4
    $ sudo make install
    $ cd ..

#### Qwt/PyQwt

Since PyQwt is on Sourceforce, I couldn't find a direct URL to download from. So I downloaded it from [the PyQwt sourceforge project](http://pyqwt.sourceforge.net/) with my browser to my `~/Downloads` directory.

First Qwt:

    $ cp ~/Downloads/PyQwt-5.2.0.tar.gz  .
    $ tar -zxvf PyQwt-5.2.0.tar.gz
    $ cd PyQwt-5.2.0
    $ cd qwt-5.2
    $ cat >> qwtconfig.pri <<EOF
    CONFIG += release QwtDll
    EOF
    $ qmake -spec macx-g++
    $ make -j 4
    $ sudo make install
    $ sudo install_name_tool -id /usr/local/qwt-5.2.1-svn/lib/libqwt.5.dylib /usr/local/qwt-5.2.1-svn/lib/libqwt.5.dylib

Then PyQwt:

    $ cd ../configure
    $ python2.7 configure.py --extra-include-dirs=/usr/local/qwt-5.2.1-svn/include --extra-lib-dirs=/usr/local/qwt-5.2.1-svn/lib --extra-libs=qwt
    $ make -j 4
    $ sudo make install
    $ cd ../..

#### Bison

    $ curl -C - -O ftp://ftp.gnu.org/gnu/bison/bison-2.5.tar.gz
    $ tar -zxvf bison-2.5.tar.gz 
    $ cd bison-2.5 
    $ ./configure --disable-dependency-tracking CFLAGS=-Os
    $ make -j 4
    $ sudo make install
    $ cd ..

#### CMake

    $ curl -C - -O http://www.cmake.org/files/v2.8/cmake-2.8.7.tar.gz
    $ tar -zxvf cmake-2.8.7.tar.gz
    $ cd cmake-2.8.7
    $ ./bootstrap --docdir=/share/doc/CMake --mandir=/share/man
    $ make -j 4
    $ sudo make install

## Fork and Checkout Quantum QGIS

- Create a [GitHub](https://github.com/) account
- Fork the [Quantum-GIS project](https://github.com/qgis/Quantum-GIS)
- Checkout your fork.
  - I used [GitHub for Mac](http://mac.github.com/) and checked it out to my home directory.


## Building QGIS

    $ cd ~/Quantum-GIS/
    $ mkdir build
    $ cd build
    $ cmake -D CMAKE_INSTALL_PREFIX=~/Applications -D CMAKE_BUILD_TYPE=MinSizeRel -D WITH_INTERNAL_SPATIALITE=FALSE -D QWT_LIBRARY=/usr/local/qwt-5.2.1-svn/lib/libqwt.dylib -D QWT_INCLUDE_DIR=/usr/local/qwt-5.2.1-svn/include -D BISON_EXECUTABLE=/usr/local/bin/bison ..
    $ make -j 4

### Install to `/Users/brian/Applications`
    
    $ make install
    
### Install to `/Applications`

    $ sudo make install

## Merge Master Changes

When you want to update your own fork with changes from the main project:

    $ git remote add upstream git://github.com/qgis/Quantum-GIS.git
    $ git pull --rebase upstream master

## Making Changes

TK

## Submit a Pull Request

TK

