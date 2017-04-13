FROM python:2-onbuild

ENTRYPOINT [ "./elasticsearch-stress-test.py" ]
