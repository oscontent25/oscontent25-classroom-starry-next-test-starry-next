# StarryOS

[![CI](https://github.com/arceos-org/starry-next/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/arceos-org/starry-next/actions/workflows/ci.yml)

A monolithic kernel based on [ArceOS](https://github.com/arceos-org/arceos).


## Quick Start
 
If you use Codespace or Docker, it will be very convenient for testing. 

If you decide to use Docker, you can refer to the following commands:
```
docker create --privileged -w /work  -v $(pwd):/work docker.educg.net/cg/os-contest:20250226 sleep inf
docker start $(docker ps -lq)
docker exec -it $(docker ps -lq) bash
```

If you want to build locally, please refer to the environment configuration of the original repository.



### About the testcases:
By executing `./config.sh platform`, the challenge will be automatically fetched, and the corresponding image file will be generated in the current directory. The `platform` can be set to either `riscv` or `loongarch`, depending on which architecture you want to test for the challenge.

### About execution:
 
You can choose two testing methods:

#### Custom test

You can directly execute `make all` in the current directory to compile the OS. Then, execute one of the following commands:

For **RISC-V**:
```bash
qemu-system-riscv64 -machine virt -kernel ./kernel-rv -m 2G -nographic -smp 2 -bios default -drive file=sdcard-riscv64.img,if=none,format=raw,id=x0 \
                    -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 -no-reboot -device virtio-net-device,netdev=net -netdev user,id=net \
                    -rtc base=utc
```

For **LoongArch**:
```bash
qemu-system-loongarch64 -m 1G -smp 1 -kernel ./kernel-la -device virtio-blk-pci,drive=disk0 -drive id=disk0,if=none,format=raw,file=sdcard-loongarch64.img -no-reboot -device virtio-net-pci,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:5555,hostfwd=udp::5555-:5555 -nographic
```

These commands will run the respective virtual machines for either **RISC-V** or **LoongArch** platforms.
(The command is referenced from the original repository.)
The specific testcase to test can be specified through `apps/oscomp/testcase_list`. It depends on which test cases you want to test. It can easily help you debug.

#### Standard test

**Attention!**
If you have previously run `make all`, please run `make clean` first to ensure a clean configuration.

The command for the test cases is as follows:
```
make oscomp_test ARCH=riscv64 LIBC=musl
```
According to the basic requirements, you need to pass all tests for the two architectures, RISC-V and LoongArch, as well as the four combinations of musl and glibc.











