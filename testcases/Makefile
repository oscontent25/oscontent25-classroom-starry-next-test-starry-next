# Makefile

.PHONY: all riscv64 loongarch64

# 默认目标
all:
	@echo "Please specify a target: riscv64 or loongarch64"

# riscv64 相关操作
riscv64:
	make -f Makefile.sub clean
	mkdir -p sdcard/riscv64/musl
	make -f Makefile.sub PREFIX=riscv64-buildroot-linux-musl- DESTDIR=sdcard/riscv64/musl
	cp /opt/riscv64--musl--bleeding-edge-2020.08-1/riscv64-buildroot-linux-musl/sysroot/lib/libc.so sdcard/riscv64/musl/lib
	sed -E -i 's/#### OS COMP TEST GROUP ([^ ]+) ([^ ]+) ####/#### OS COMP TEST GROUP \1 \2-musl ####/g' sdcard/riscv64/musl/*_testcode.sh

	make -f Makefile.sub clean
	mkdir -p sdcard/riscv64/glibc
	make -f Makefile.sub PREFIX=riscv64-linux-gnu- DESTDIR=sdcard/riscv64/glibc
	cp /usr/riscv64-linux-gnu/lib/libc.so sdcard/riscv64/glibc/lib
	sed -E -i 's/#### OS COMP TEST GROUP ([^ ]+) ([^ ]+) ####/#### OS COMP TEST GROUP \1 \2-glibc ####/g' sdcard/riscv64/glibc/*_testcode.sh

# loongarch 相关操作
loongarch64:
	make -f Makefile.sub clean
	mkdir -p sdcard/loongarch64/musl
	make -f Makefile.sub PREFIX=loongarch64-linux-musl- DESTDIR=sdcard/loongarch64/musl
	cp /opt/musl-loongarch64-1.2.2/lib/libc.so sdcard/loongarch64/musl/lib
	sed -E -i 's/#### OS COMP TEST GROUP ([^ ]+) ([^ ]+) ####/#### OS COMP TEST GROUP \1 \2-musl ####/g' sdcard/loongarch64/musl/*_testcode.sh

	make -f Makefile.sub clean
	mkdir -p sdcard/loongarch64/glibc
	make -f Makefile.sub PREFIX=loongarch64-linux-gnu- DESTDIR=sdcard/loongarch64/glibc
	cp /opt/gcc-13.2.0-loongarch64-linux-gnu/sysroot/usr/lib64/libc.so sdcard/loongarch64/glibc/lib
	sed -E -i 's/#### OS COMP TEST GROUP ([^ ]+) ([^ ]+) ####/#### OS COMP TEST GROUP \1 \2-glibc ####/g' sdcard/loongarch64/glibc/*_testcode.sh

clean:
	make -f Makefile.sub clean
	rm -rf sdcard/riscv64/*
	rm -rf sdcard/loongarch64/*