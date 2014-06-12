.PHONY: all install tests coverage clean-pyc

all: ve

ve:
	virtualenv ve
	ve/bin/pip install -U setuptools pip
	ve/bin/pip install -r requirements-test.txt

install:
	python setup.py install

clean: clean-pyc clean-coverage
	rm -rf ve dist build *.egg-info

clean-pyc:
	find . -type f -name '*.pyc' -delete

clean-coverage:
	rm -rf .coverage coverage-html

tests: ve clean-pyc
	./runtests -v

coverage: ve clean-pyc clean-coverage
	./runtests --with-coverage --cover-package=smpp
