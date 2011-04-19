#!/bin/bash

svn log -v --xml | ./svncl.pl > Changelog

