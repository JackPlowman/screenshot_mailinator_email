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
git clone https://github.com/NHSDigital/screenshot_mailinator_email.git
cd screenshot_mailinator_email
```

### Prerequisites

You need to have the following tools installed:

- [asdf](https://asdf-vm.com/) version manager

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

## Usage

Run the script with the URL of the email you want to screenshot.

`uv run python screenshot_mailinator_email.py MAILINATOR_URL_HERE`

## License

This project is licensed under the MIT License.
