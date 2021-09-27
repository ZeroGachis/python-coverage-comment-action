# GitHub Action: Coverage Comment

Publish diff coverage report as PR comment, and create a coverage badge to
display on the readme.

See example at: https://github.com/ewjoachim/coverage-comment-action-example

## What does it do?

This action operates on an already generated `coverage.xml` (Cobertura) file as
generated by most tools, accross languages.

It has two main modes of operation:

### PR mode

If acting on a PR, it will analyze the XML file, and produce a comment that
will be posted to the PR. If a comment had already previously be written,
it will be updated. The comment contains information on the evolution
of coverage rate attributed to this PR, as well as the rate of coverage
for lines that this PR introduces. There's also a small analysis for each
file in a collapsed block.

See: https://github.com/ewjoachim/coverage-comment-action-example/pull/3#issuecomment-927207016

### Default branch mode

If acting on the repository's default branch, it will extract the coverage
rate and create a small JSON file that will be stored on the repository's wiki.
This file will then have a stable URL, which means you can create a
[shields.io](https://shields.io/endpoint) badge from it.

See: https://github.com/ewjoachim/coverage-comment-action-example

## Usage

### Setup

Please ensure that the **repository wiki has been initialized** with at least a
single page created. Once it's done, you can disable the wiki for the
repository.

### Minimal usage
```yaml
- name: Display coverage
  uses: ewjoachim/coverage-comment-action@v1
  with:
    GITHUB_TOKEN: ${{ github.token }}
```

### Maximal usage
```yaml
- name: Display coverage
  uses: ewjoachim/coverage-comment-action@v1
  with:
    GITHUB_TOKEN: ${{ github.token }}

    # Path and filename of the coverage XML file to analyze.
    COVERAGE_FILE: "coverage.xml"

    # Whether or not a badge will be generated and stored.
    BADGE_ENABLED: "true"

    # Name of the json file containing badge informations stored in the repo wiki.
    BADGE_FILENAME: coverage-comment-badge.json

    # If the coverage percentage is above or equal to this value, the badge will be green.
    MINIMUM_GREEN: 100

    # Same with orange. Below is red.
    MINIMUM_ORANGE: 70

    # [Advanced] Specify a different template for the comments that will be written on the PR.
    COMMENT_TEMPLATE: ""

    # [Advanced] Additional args to pass to diff cover (one per line)
    DIFF_COVER_ARGS: ""
```

### Pinning
On the examples above, the version was set to `v1` (a branch). You can also pin
a specific version such as `v1.0.3` (a tag). There are still things left to
figure out in how to manage releases and version. If you're interested, there's
a [corresponding issue](https://github.com/ewjoachim/coverage-comment-action/issues/8).

### Note on the state of this action

There is no automated test and the dependencies are not frozen, so it's
possible that it fails at some point if a dependency breaks compatibility.
If this happens, we'll fix it and put better checks in place.

It's probably usable as-is, but you're welcome to offer feedback and, if you
want, contributions.

### Note on advanced options

``COMMENT_TEMPLATE`` and ``DIFF_COVER_ARGS`` are somewhat experimental.
They haven't been thouroughly tested.