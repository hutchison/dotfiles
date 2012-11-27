#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import subprocess

def get_password(desc):
    command = "pass show " + desc
    output = subprocess.check_output(command, shell=True,
                                     stderr=subprocess.STDOUT)
    return output.rstrip()
