# terraform-master-account

[![CircleCI](https://circleci.com/gh/tmknom/terraform-master-account.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-master-account)
[![License](https://img.shields.io/github/license/tmknom/terraform-master-account.svg)](https://opensource.org/licenses/Apache-2.0)

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-master-account.git
cd terraform-master-account
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
upgrade                        Upgrade makefile
```

## License

Apache 2 Licensed. See LICENSE for full details.
