#!/bin/env python
import os
import sys
import datetime

def open_file(path, mode='r'):
    if sys.version_info[0] == 3:
        return open(path, mode=mode, encoding='utf-8')
    else:
        return open(path, mode=mode)

class BashRc(object):
    directory_path = os.path.expanduser('~/.bashrc.d')
    config_path = os.path.expanduser('~/.bashrc.d/bashrc.conf')
    bashrc_generated_path = os.path.expanduser('~/.bashrc.generated')
    bashrc_path = os.path.expanduser('~/.bashrc')

    @staticmethod
    def is_module_name(name):
        name = name.strip()
        if name.startswith('#'):
            return False
        elif len(name) == 0:
            return False
        else:
            return True

    def __init__(self, debug_mode=False):
        module_names = [
            name.strip()
            for name in open_file(self.config_path).readlines()
            if self.is_module_name(name)
        ]
        self.module_names = module_names
        self.debug_mode = debug_mode

    def generate_module_data(self, name):
        path = os.path.join(self.directory_path, name)
        _data = open_file(path).read().strip()
        data_list = [
            '##################################',
            '# {}'.format(name),
            '##################################',
        ]

        if self.debug_mode:
            data_list.append("echo 'DEBUG: {}'".format(name))

        if self.debug_mode:
            data_list += [
                '_start=`date +%s%N`',
                '{}'.format(_data),
                '_end=`date +%s%N`',
                'echo {} $((_end - _start))'.format(name),
            ]
        else:
            data_list += [
                '{}'.format(_data),
            ]

        data = '\n'.join(data_list)

        return data

    def generate(self):
        data = '\n'.join([
            '#!/usr/bin/bash',
            '',
            '########################################',
            '# THIS FILE IS AUTOMATICALLY GENERATED #',
            '########################################',
            '',
            '# generated at: {}'.format(datetime.datetime.now()),
            '',
            '',
            '',
            '',
            '',
        ])
        module_data = []
        for name in self.module_names:
            try:
                module_data.append(self.generate_module_data(name))
            except Exception as exp:
                print("Exception catch module name:{}".format(name), exp)

        data += '\n\n\n\n'.join(module_data)
        return data

    def update(self):
        with open_file(self.bashrc_generated_path, 'w') as fp:
            fp.write(self.generate())
        if not os.path.exists(self.bashrc_generated_path):
            with open_file(self.bashrc_path, 'a') as fp:
                fp.write(f"source {self.bashrc_generated_path}\n")

def main():
    print('regenbashrc')
    debug_mode = False
    if len(sys.argv) >= 2:
        print('debug mode')
        debug_mode = True
    bashrc = BashRc(debug_mode=debug_mode)
    bashrc.update()

if __name__ == '__main__':
    main()
