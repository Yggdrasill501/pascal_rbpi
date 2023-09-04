# Password Manager
This project conatains password manager programed in freepascal and is using webassembly

## How to run
before running the program you need to install the following packages
```
% sudo apt install lld-12
% ln -sf /usr/lib/llvm-12/bin/wasm-ld ~/bin/wasm32-wasi-wasm-ld
% ln -sf /usr/lib/llvm-12/bin/wasm-ld ~/bin/wasm32-embedded-wasm-ld
```
then you have to install this git repo
```
% git clone https://gitlab.com/freepascal.org/fpc/source.git fpc
```
### Compiling
```
% make clean all OS_TARGET=wasi CPU_TARGET=wasm32 BINUTILSPREFIX= OPT="-O-" PP=fpc
% make crossinstall OS_TARGET=wasi CPU_TARGET=wasm32 INSTALL_PREFIX=$HOME/fpcwasm
% ln -sf ~/fpcwasm/lib/fpc/3.3.1/ppcrosswasm32 ~/bin/ppcrosswasm32
```
### Compiling target
```
% make clean all OS_TARGET=embedded CPU_TARGET=wasm32 BINUTILSPREFIX= OPT="-O-" PP=fpc
% make crossinstall OS_TARGET=embedded CPU_TARGET=wasm32 INSTALL_PREFIX=$HOME/fpcwasm
% ln -sf ~/fpcwasm/lib/fpc/3.3.1/ppcrosswasm32 ~/bin/ppcrosswasm32
```

### Use of compiler
```
#ifdef cpuwasm32
-Fu/home/yourusername/fpcwasm/lib/fpc/$fpcversion/units/$fpctarget/*
-Fu/home/yourusername/fpcwasm/lib/fpc/$fpcversion/units/$fpctarget/rtl
#endif
```

## Enncryption 
Cesar Cipher model

## Sources
- [Free Pascal](https://www.freepascal.org/)
- [Wasm](https://webassembly.org/)
- [Wasm Compiler for free pascal](https://wiki.freepascal.org/WebAssembly/Compiler)
- [Free Pascal in vs code](https://stephan-bester.medium.com/free-pascal-in-visual-studio-code-e1e0a240a430)
- [Fpc Repo](https://gitlab.com/freepascal.org/fpc/source)
- [Pascal to javasript blog](https://samadhiweb.com/blog/2022.04.09.fpc.wasm.html)
- [Pascal to javasript wiki](https://wiki.freepascal.org/pas2js)

