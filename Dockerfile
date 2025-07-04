FROM fedora:latest
# RUN dnf update;
RUN dnf install -y neovim python3-neovim;
RUN dnf install -y git;
RUN dnf install -y golang;
RUN dnf install -y npm;
RUN dnf install -y fzf ripgrep wget unzip;
WORKDIR /root/.config/nvim
COPY . .
ENTRYPOINT ["nvim"]
