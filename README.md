# The OpenSAFELY Setup Action 

This is a GitHub Action to provide some basic setup in a GitHub workflow.

It is designed to perform some basic setup and install some tools that are common across many of our OpenSAFELY jobs.

## Usage

See [action.yml](action.yml) for full details.

### Example with pip dependencies

```
...

jobs:
  my-job:
    runs-on: ubuntu-22.04

    steps:
      - uses: "opensafely-core/setup-action@v1"
        with:
          python-version: "3.10"
          cache-dependency-path: "requirements.*.txt"
          install-just: true
```

### Example with uv dependencies and uv-managed python versions

```
...

jobs:
  my-job:
    runs-on: ubuntu-22.04

    steps:
      - uses: actions/checkout@v6
      - uses: "opensafely-core/setup-action@v1"
        with:
          install-just: true
          install-uv: true
          cache: uv
```


### Action inputs

| Name | Description | Required | Default |
| --- | --- | --- | --- |
| python-version | The Python version to use. A value is required in order to install Python | no | - |
| cache | If dependencies should be cached, use this parameter to specify the package manager. Supported values: pip, pipenv, poetry, uv. Set to null to disable dependency caching.  Only applicable if using python-version to install Python. | no | pip |
| cache-dependency-path|The path to dependency files whose dependencies should be cached. Only applicable if using python-version to install Python.|no|requirements.*.txt|
| install-uv | If true, this installs uv| no | false |
| install-just | If true, this installs Just | no | false |
| just-version | Just version to install. Omit to install the latest release. | no | 1.59.0 |


> [!TIP]
> `python-version` is only required if you need to > install a system python. If using `uv`, you can omit `python-version` and allow `uv` to manage  python versions.

## Releasing a new version

A new tag is automatically created on merges to the `main` branch via the
`tag-release` workflow.


By default, tags will be created for minor versions. Use [semantic commits](https://github.com/mathieudutour/github-tag-action#bumping) to tag a different version if required (e.g. `feat: ` for a new minor version.)

Currently releases are not automated; once a new tag is created, create a new release from the tag in GitHub.

