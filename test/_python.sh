
#!/bin/bash -e

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

declare -a versions=( '2.6.9' '2.7.9' '3.2.5' '3.3.6' '3.4.6' '3.5.2' '3.6.0' 'pypy-5.1' )   

for version in "${versions[@]}"
 do
  echo "============ Setting up pyenv for $version  ==========="
  eval "$(pyenv init -)"
  pyenv virtualenv $version virtual$version
  pyenv activate virtual$version
  python -V
  echo "==================== Deactivating pyenv ========================"
  pyenv deactivate
  echo "=================== Deactivation success========================"
done

