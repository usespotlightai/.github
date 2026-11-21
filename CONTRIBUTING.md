# Contributing

Each repository has its own setup. Read the `CONTRIBUTING.md` of the repository you change, if it has one. The main one is in [spotlight](https://github.com/usespotlightai/spotlight/blob/develop/CONTRIBUTING.md).

## Issues

- Open the issue in the repository whose code the change touches.
- For work across repositories, open a parent issue in `spotlight` and add sub-issues in the other repositories.
- All issues go on the [Spotlight project](https://github.com/orgs/usespotlightai/projects). The project holds status, priority and feature.

## Pull requests

- The title is a [Conventional Commit](https://www.conventionalcommits.org), such as `feat: add the judge to stations`. Pull requests are squash-merged, so the title becomes the commit.
- Write `Fixes #123` in the description. The issue closes when the pull request merges to the default branch.

## Labels

Labels are defined in this repository under `labels/`. Run `scripts/sync-labels.sh` after you change them.
