#!/usr/bin/python3
"""Fabric script that generates a .tgz archive from the contents of the
web_static folder of your AirBnB Clone repo, using the function do_pack"""
from datetime import datetime
from fabric.api import local


def do_pack():
    """Creates archive from web_static directory"""
    local("mkdir -p versions")
    file = 'versions/web_static_{}.tgz'\
            .format(datetime.strftime(datetime.now(), "%Y%m%d%I%M%S"))
    comp = 'tar -cvzf {} web_static'.format(file)
    tar_file = local(comp)
    if tar_file.failed:
        return None
    return file
