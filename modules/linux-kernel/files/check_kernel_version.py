#!/usr/bin/env python

import sys, platform

expected_version = sys.argv[1].strip()
actual_version = platform.uname()[2]

if not expected_version in actual_version:
	sys.exit(-1)
