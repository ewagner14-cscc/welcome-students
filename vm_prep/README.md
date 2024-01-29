# VM prep

A few goals for getting the CSCC Vm preparred and ready to go.
- easy to use
- familiar tools

# 1password

my.1password.com

op account add --address my.1password.com --email eric.wgnr@gmail.com --secret-key @@33Moths-Flew-Democratically66@@


1  sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    2  sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
    3  sudo dnf check-update -y 1password-cli && sudo dnf install 1password-cli
    4  yum install -y dnf
    5  sudo yum install -y dnf
    6  sudo dnf check-update -y 1password-cli && sudo dnf install 1password-cli
    7  op --version
