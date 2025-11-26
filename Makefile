.PHONY: clean

GCC      = riscv64-unknown-elf-gcc
OBJDUMP  = riscv64-unknown-elf-objdump
CFLAGS   = -march=rv32i -mabi=ilp32

SRC_DIR  = c_programm
SRC      = $(SRC_DIR)/lab1.c

ELF      = $(SRC_DIR)/lab1.elf
DUMP     = $(SRC_DIR)/lab1.dump

default: $(DUMP)

$(ELF): $(SRC)
	$(GCC) $(CFLAGS) $< -o $@

$(DUMP): $(ELF)
	$(OBJDUMP) -D $< > $@

clean:
	rm -f $(ELF) $(DUMP)
