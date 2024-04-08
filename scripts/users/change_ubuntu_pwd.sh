#!/bin/bash
set -e

if id -u "${DEFAULT_USER}" >/dev/null 2>&1; then
    echo "${DEFAULT_USER}:ubuntu" | chpasswd
    usermod -a -G sudo "${DEFAULT_USER}"
else
    echo "${DEFAULT_USER} doesn't exits ???"
fi