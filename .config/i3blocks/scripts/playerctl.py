#!/usr/bin/python
import subprocess

class player:
    def __init__(self, player):
        self.player = player

    def status(self):
        return self._command(["status"])

    def metadata(self, argument):
        return self._command(["metadata", argument])

    def command(self, command):
        self._command([command])

    def _command(self, commandpart):
        command = ["playerctl", "-p", self.player]
        command.extend(commandpart)
        status = subprocess.check_output(command).decode('UTF-8').split('\n')[0]

        return status

