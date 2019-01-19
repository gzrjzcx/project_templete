SHELL := /bin/bash

# --------------- set various paths ---------------
SRC = src
OBJ = obj
BIN = bin
RES = res
OUT = out
INC = includes
INT = init

TEMP = temp.txt
NAME = default

# --------------- set rules ---------------
.PHONY: cinit
cinit:
	@mkdir -p $(SRC) $(RES) $(INC)
	@touch $(SRC)/main.c
	@echo "#include <stdio.h>" > $(SRC)/main.c
	@cp ${INT}/LICENSE ./

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
	@pwd
	@rm -rf $(SRC) $(RES) $(INC)
	@rm -f ../LICENSE

%:
	@:

# Instead of:
#      awk '{print $1}'
# I had to use:
#      awk '{print $$1}'    
# This is necessary because $1 is a *make* variable but $$1 
# is the awk variable I wanted ($1)....

#####
# Always not use PATH as the variable name!!!
# Because I wrong set PATH variable as below: 
# ```
# PATH=
# ```
# then the whole makefile cannot get any current address to read file,
# most of command are error with message:
# mkdir: no such file or directroy
# therefore, do not set PATH whenever!!! 

# How to use pipeline at Makefile:
# Using command substitue --> $() to write shell command, like below:
# 	@echo "$(shell cat $(INT)/$(TEMP) | awk '{print $1}')"

# Pass arguments to Makefile:
# use this command substitution $(filter-out $@,$(MAKECMDGOALS)) to get the 
# passed arguments.
# ```
# %:
#	@:
# ```
# use this rule to pass arguments.
# %: - rule which match any task name;  
# @: - empty recipe = do nothing














