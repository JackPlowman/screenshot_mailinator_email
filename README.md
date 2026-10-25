# Screenshot Mailinator Email

This is a simple Python script that will take a screenshot of an email on mailinator.

## Table of Contents

- [Screenshot Mailinator Email](#screenshot-mailinator-email)
  - [Table of Contents](#table-of-contents)
  - [Setup](#setup)
    - [Prerequisites](#prerequisites)
    - [Configuration](#configuration)
      - [Additional Tools](#additional-tools)
  - [Installation UV Dependencies](#installation-uv-dependencies)
  - [Usage](#usage)
  - [License](#license)

## Setup

Clone the repository

```shell
git clone https://github.com/JackPlowman/screenshot_mailinator_email.git
cd screenshot_mailinator_email
```

### Prerequisites

You need to have the following tools installed:

- [asdf](https://asdf-vm.com/) version manager
- Python 3.15.1 and uv 0.13.5 (pinned in `.tool-versions`)

asdf will automatically install the required versions of Python and other dependencies.

### Configuration

Installation of the toolchain dependencies.

```shell
just project-install
```

#### Additional Tools

You may want to install additional tools for development and linting.

- [zizmor](https://github.com/zizmorcore/zizmor)

## Installation UV Dependencies

Install python dependencies with uv.

`uv sync`

For development, run `uv sync --all-extras --locked`, then `just install-git-hooks`
to install the prek checks. Run `prek run --all-files` to check the whole repository.

Install the Chromium browser before taking screenshots: `uv run playwright install chromium`.

## Usage

Run the script with the URL of the email you want to screenshot.

`uv run python screenshot_mailinator_email.py MAILINATOR_URL_HERE`

## License

This project is licensed under the MIT Licence. See the [LICENCE](LICENCE) file for details.
