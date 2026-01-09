>[!WARNING]
>*This is not currently a usable project. It is still very much a work in progress. Instructions may not properly work, and functionality may be limited*
## stm-rust
This is a small project to learn how to build embedded rust projects in rust. I am using nix as a build system for repeatable builds.
I will be using the stm32 Nucleo-g431k for this project, as far as I'm aware, small changes need to be made to port this to other g4 boards, and larger changes need to be made compatible with stm32 boards more generally. Use at your own risk.

## Usage
Clone the repository into your current directoy ```git clone https://github.com/minks-d/stm-rust``` and then ```cd ./stm-rust```.

### Development
To enter a development environment with all of the necessary tools, use ```nix develop```.

### Building
To build the project use ```nix build```.

### Uploading and running
> [!IMPORTANT]
> Not implemented yet

To push the project to the board, simply use ```nix run```.
