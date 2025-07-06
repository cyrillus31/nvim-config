FROM fedora:latest
# RUN dnf update;
RUN dnf install -y neovim python3-neovim;
RUN dnf install -y git;
RUN dnf install -y golang;
RUN dnf install -y npm && npm install -g yarn;
RUN dnf install -y fzf ripgrep wget unzip;
ENV SHELL=/bin/bash
WORKDIR /root/.config/nvim
COPY . .
# ENTRYPOINT ["nvim"]
ENTRYPOINT ["sh", "-c"]
CMD ["nvim"]
