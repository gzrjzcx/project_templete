CMF = "init/init_c.mk"

# --------------- set compiler command ---------------
CC = icc
CCFLAGS = -std=c99
CCFLAGS += -Wall
LIB = -lm 
DEFINE = 

# --------------- set various paths ---------------
SRC = src
OBJ = obj
BIN = bin
RES = res
OUT = out
SCRIPTS = scripts
INC = includes

INCLUDES += -I$(INC) -I$(AFF) -I$(LOO) -I$(OMP) -I$(UTI)

VPATH = $(SRC) $(AFF) $(LOO) $(OMP) $(UTI)

# --------------- set specific name ---------------
MAIN = $(SRC)/main
MAIN_OBJ = $(OBJ)/main.o
LEETCODE = leetcode

# --------------- set make rules ---------------

## dir: create all necessary directories
.PHONY: dir
dir:
	@mkdir -p $(OBJ) $(BIN) $(OUT)

## clean: clean all directories
.PHONY: clean
clean:
	@rm -rf $(OBJ) $(BIN) $(OUT)

# here is the make command, and using different flag to compile
.PHONY: all
all: dir
	@make $(BIN)/$(LEETCODE) -B

# --------------- set compile rules ---------------
$(OBJ)/%.o: %.c
	$(CC) $(CCFLAGS) $(DEFINE) $(INCLUDES) -o $@ -c $<

$(BIN)/$(LEETCODE): $(MAIN_OBJ)
	$(CC) $(CCFLAGS) $^ -o $@ $(LIB)

# --------------- set init_c rules ---------------
# please do not modify below rules

.PHONY: cinit
cinit:
	@make -f $(CMF) cinit -B

.PHONY: cnew
cnew:
	@make -f $(CMF) cnew $(filter-out $@,$(MAKECMDGOALS)) -B

.PHONY: submitcheck
submitcheck:
	@make -f $(CMF) submitcheck $(filter-out $@,$(MAKECMDGOALS))

.PHONY: cclean_
cclean_:
	@make -f $(CMF) cclean



%:
	@:




























