#!/usr/bin/env python

import os
from subprocess import call

MYPATH = os.path.realpath(os.path.dirname(__file__))
BIN = os.path.join(MYPATH, 'hub')
MAN = os.path.abspath(os.path.join(MYPATH, '../man/hub.1'))


cmds = [
    'curl http://defunkt.io/hub/standalone -sLo %s' % BIN,
    ('curl https://github.com/defunkt/hub/raw/master/man/hub.1 --create-dirs '
     '-sLo %s') % MAN,
    'sudo ln -sf %s /opt/local/man/' % MAN
]

for cmd in cmds:
    print cmd
    call(cmd, shell=True)
