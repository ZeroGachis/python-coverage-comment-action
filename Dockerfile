# See Dockerfile.build for instructions on bumping this.
FROM ewjoachim/python-coverage-comment-action-base:v3

COPY coverage_comment ./coverage_comment
RUN pip install .
