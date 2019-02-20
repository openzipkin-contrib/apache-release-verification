# apache-release-verification
This project aims to automate some Apache Software Foundation source release verification steps.

This is semi-automatic, as it walks through each task, asking "Does X look good to you?". The goal is
to lower the barrier to participating in release votes.

## Work in Progress
This is very early days.. you'll need to also manually verify to double-check. Ex we have a [wiki](https://cwiki.apache.org/confluence/display/ZIPKIN/Verifying+a+Source+Release).

## Just run it!

This requires Docker to be installed on your machine, but nothing else.

```bash
./check.sh brave-karaf 0.1.2 --gpg-key BB67A050 --git-hash 3cf4ac6577eb0d4775d20f24814e7a0852fa1635
```

## The hard way

For hacking on the script, or running it without Docker, you'll need some system-level dependencies.
A non-complete list (the script will fail when it hits a missing one anyway):

* wget
* gpg
* sha256sum
* git
* maven

```bash
$ cd src
$ virtualenv --python=python3 venv
$ . venv/bin/activate
$ pip install -r requirements.txt
### and now actually run it!
$ python main.py brave-karaf 0.1.2 --gpg-key BB67A050 --git-hash 3cf4ac6577eb0d4775d20f24814e7a0852fa1635
```

## Hacking

Install linter, type-checker, and code formatter; run them before committing:

```bash
$ cd src
$ . venv/bin/activate
$ pip install -r requirements-dev.txt
$ make
```
