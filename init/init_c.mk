SHELL := /bin/bash

# --------------- set various paths ---------------
SRC = src
OBJ = obj
BIN = bin
RES = res
OUT = out
INC = includes
SCRIPTS = scripts
INT = init

TEMP = temp.txt
NAME = default

# --------------- set rules ---------------
.PHONY: cinit
cinit:
	@mkdir -p $(SRC) $(RES) $(INC) $(OBJ) $(OUT) $(BIN) $(SCRIPTS)
	@touch $(SRC)/main.c
	@echo "#include <stdio.h>" > $(SRC)/main.c

.PHONY: cnew
cnew:
	@echo "$(filter-out $@,$(MAKECMDGOALS))" > $(INT)/$(TEMP)
	@chmod u+x $(INT)/create_c.sh
	@./$(INT)/create_c.sh
	@rm -f $(INT)/$(TEMP)

.PHONY: submitcheck
submitcheck:
	@chmod u+x $(INT)/submit_check.sh
	@./$(INT)/submit_check.sh

.PHONY: cclean
cclean:
	@rm -rf $(SRC) $(RES) $(INC) $(OBJ) $(OUT) $(BIN) $(SCRIPTS)

%:
	@:
















