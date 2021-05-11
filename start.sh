# This is a Glitch startup script
ROOT_ENV=.rootenv
VIRTUALENV=.venv
if [ ! -d $ROOT_ENV ]; then
  python3 -m venv $ROOT_ENV
fi
if [ ! -f $ROOT_ENV/Scripts/pip ]; then
  curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | $ROOT_ENV/Scripts/python
  $ROOT_ENV/Scripts/pip install virtualenv
fi
if [ ! -d $VIRTUALENV ]; then
    $ROOT_ENV/Scripts/virtualenv $VIRTUALENV
fi
if [ ! -f .env ]; then
    cp .env.example .env
    refresh
fi
source $VIRTUALENV/Scripts/activate
echo "Activated virtualenv Python is `which python`"
pip install -r requirements.txt
python app.py 