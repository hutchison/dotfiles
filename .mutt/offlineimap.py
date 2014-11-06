#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import subprocess
import os

def get_password(desc):
    command = "pass show " + desc
    with open(os.devnull, 'w') as DEVNULL:
        output = subprocess.check_output(command, shell=True, stderr=DEVNULL)
    return output.rstrip()
