NASM = nasm
LD   = ld

%: %.asm
	@clear
	@echo "Assembling $<..."
	$(NASM) -f elf64 $< -o $*.o

	@echo "Linking $*.o..."
	$(LD) $*.o -o $@

	@echo ""
	@echo "Created files:"
	@echo "  - $*.o"
	@echo "  - $@"
	@echo ""

	@echo "Running $@..."
	@./$@