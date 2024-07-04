#!/bin/bash
#
#
# Command to check ip address on your Mac using ifconfig
#
ifconfig en0 | awk '/net / {print $0}' | awk '/broadcast / {print $2}'
