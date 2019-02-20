VENV=venv
PIP_LOG=pip-log.txt
PRECOMMIT_SRC=.githooks/pre-commit
PRECOMMIT_DST=.git/hooks/pre-commit

export VIRTUAL_ENV := $(abspath ${VENV})
export PATH := ${VIRTUAL_ENV}/bin:${PATH}

${PRECOMMIT_DST}: ${PRECOMMIT_SRC}
	cp $< $@

${PIP_LOG}: requirements.txt requirements-dev.txt
	if [[ ! -e ${VENV}/bin/activate ]]; then virtualenv --python=python3 ${VENV}; fi
	pip install -r requirements.txt -r requirements-dev.txt | tee ${PIP_LOG}

.PHONY: setup-dev
setup-dev: ${PIP_LOG} ${PRECOMMIT_DST}

.PHONY: lint
lint: setup-dev
	black src/*.py
	isort src/*.py
	flake8 src/*.py
	mypy src/*.py

.PHONY: clean
clean:
	rm -rf src/*.pyc src/__pycache__ .mypy_cache ${VENV} ${PIP_LOG}
