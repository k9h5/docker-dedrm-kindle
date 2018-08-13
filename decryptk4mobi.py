#!/usr/bin/env python
# -*- coding: utf-8 -*-

from scriptinterface import decryptk4mobi

# TODO: argparse
import sys
outDir = sys.argv[1] # '/root/'
srcFilePath = sys.argv[2] # '/root/.DeDRMPrefs/a.azw'

decryptk4mobi(srcFilePath, outDir, '/root/.DeDRMPrefs/')
