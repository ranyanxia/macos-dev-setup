# macOS Development Environment Setup

This project provides a set of shell scripts to automate the setup of a local development environment on macOS. The scripts cover various aspects of the setup, including shell environment configuration, installation of essential development tools, and configuration of programming languages.

## Project Structure

```
macos-dev-setup
├── src
│   ├── setup.sh               # Main script to orchestrate the setup
│   ├── configs
│   │   ├── .zshrc             # Zsh shell environment configurations and aliases
│   │   └── .gitconfig         # Git configuration settings
│   └── scripts
│       ├── ssh_setup.sh       # Script to generate SSH keys
│       ├── dev_tools.sh       # Script to install development tools
│       ├── python_setup.sh     # Script to install Python
│       ├── java_setup.sh      # Script to install OpenJDK and Maven
│       ├── docker_setup.sh     # Script to install Docker and Podman
│       └── k8s_setup.sh       # Script to install Kubernetes tools
├── LICENSE                     # Licensing information
└── README.md                   # Documentation for the project
```

## Usage

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd macos-dev-setup
   ```

2. Make the setup script executable:
   ```bash
   chmod +x src/setup.sh
   ```

3. Run the setup script:
   ```bash
   ./src/setup.sh
   ```

This will execute the various setup scripts in the correct order to configure your development environment.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.