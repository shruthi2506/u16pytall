#!/bin/bash -e

    echo "============ Setting up Virtual Environment for pypy3  ==========="
    echo "mkdir ~/test_pypy3"
    mkdir ~/test_pypy3
    echo "cd ~/test_pypy3"
    cd ~/test_pypy3
    echo "virtualenv venv"
    virtualenv venv
    echo "virtualenv -p /usr/bin/pypy3" "venv"
    virtualenv -p /usr/bin/pypy3 venv
    echo "source venv/bin/activate"
    source venv/bin/activate
    printf "\n\n"

    echo "======================== Python version ============================="
    echo "python --version"
    python --version
    printf "\n\n"

    echo "==================== Deactivating virtualenv ========================"
    echo "deactivate"
    deactivate
    echo "cd ~"
    cd ~
    echo "rm -rf test_pypy3"
    rm -rf test_pypy3
    echo "rm -rf venv"
    rm -rf venv
    printf "\n\n"
