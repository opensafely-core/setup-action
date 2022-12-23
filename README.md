# The OpenSAFELY Setup Action 

This is a GitHub Action to provide some basic setup in a GitHub workflow.

It is designed to perform some basic setup and install some tools that are common across many of our OpenSAFELY jobs.

## Usage


```
...

jobs:
  my-job:
    runs-on: ubuntu-22.04

    steps:
      - uses: "opensafely-core/setup-action@v1"
        with:
          python-version: 3.10
          install-just: true
```