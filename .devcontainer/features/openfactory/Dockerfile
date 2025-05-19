FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Copy install script and assets
COPY install.sh /usr/local/bin/install.sh
COPY assets/sdk-infra /usr/local/share/sdk-infra

# Make sure the install script is executable
RUN chmod +x /usr/local/bin/install.sh

# Run the install script
RUN INSTALLINFRA=true /usr/local/bin/install.sh

# Set entrypoint
CMD ["/bin/bash"]
