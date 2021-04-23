# The Makefile to build test and main and run the test

CC := gcc
CFLAGS := -Wall

LIB_DIR := lib
SRC_DIR := src
TEST_DIR := test
BUILD_DIR := build

TEST_EXE_1 := stack_test
TEST_EXE_2 := expression_test
PROG_EXE := main


#INCLUDES := $(addprefix -I./,$(wildcard $(LIB_DIR)/*) ./$(SRC_DIR)/expression)

PROG_OBJS := $(notdir $(wildcard $(LIB_DIR)/stack/*.c) $(wildcard $(SRC_DIR)/*.c) $(wildcard $(SRC_DIR)/*/*.c))
PROG_OBJS := $(addprefix $(BUILD_DIR)/,$(PROG_OBJS:.c=.o))

TEST_OBJS_1 := $(notdir $(wildcard $(LIB_DIR)/*/*.c) ./$(TEST_DIR)/$(TEST_EXE_1).c )
TEST_OBJS_1 := $(addprefix $(BUILD_DIR)/,$(TEST_OBJS_1:.c=.o))

TEST_OBJS_2 := $(notdir $(wildcard $(LIB_DIR)/*/*.c) $(wildcard $(SRC_DIR)/*/*.c) ./$(TEST_DIR)/$(TEST_EXE_2).c )
TEST_OBJS_2 := $(addprefix $(BUILD_DIR)/,$(TEST_OBJS_2:.c=.o))

all: .mkbuild $(PROG_EXE) $(TEST_EXE_1) $(TEST_EXE_2)
	@echo "************ The Targets ************"
	@echo "** clean: to clean"
	@echo "** check: to run the test"
	@echo "** run EXP=xxx: to run the program"
	@echo "*************************************"

print:
	@echo  $(TEST_OBJS_1)
	@echo  $(TEST_OBJS_2)
	@echo  $(PROG_OBJS)
	@echo  $(INCLUDES)

$(PROG_EXE): $(PROG_OBJS)
	$(CC) $^ -o $(BUILD_DIR)/$@

$(TEST_EXE_1): $(TEST_OBJS_1)
	$(CC) $^ -o $(BUILD_DIR)/$@

$(TEST_EXE_2): $(TEST_OBJS_2)
	$(CC) $^ -o $(BUILD_DIR)/$@

LIB_SRC := $(LIB_DIR)/*
$(BUILD_DIR)/%.o: $(LIB_SRC)/%.c 
	$(CC) -MMD $(CFLAGS) -o $@ -c $<

$(BUILD_DIR)/%.o : $(TEST_DIR)/%.c
	$(CC) -MMD $(CFLAGS) -o $@ $(INCLUDES) -c $<

$(BUILD_DIR)/%.o : $(SRC_DIR)/%.c
	$(CC) -MMD $(CFLAGS) -o $@ $(INCLUDES) -c $<

$(BUILD_DIR)/%.o : $(SRC_DIR)/*/%.c
	$(CC) -MMD $(CFLAGS) -o $@ $(INCLUDES) -c $<

run: .mkbuild $(PROG_EXE)

	@echo ""
	@echo "**************************************"
	@echo "********* Run The Program ************"
	@echo "********* Run The Program ************"
	@echo "**************************************"
	@echo "**************************************"
	@echo ""
	@./$(BUILD_DIR)/$(PROG_EXE) $(EXP)

check: .mkbuild $(TEST_EXE_1) $(TEST_EXE_2) $(TEST_DIR)
	@echo ""
	@echo "**************************************"
	@echo "********** Run The Tests **************"
	@echo "**************************************"
	@echo ""
	@./$(BUILD_DIR)/$(TEST_EXE_1)
	@./$(BUILD_DIR)/$(TEST_EXE_2)

# Include automatically generated dependencies
-include $(OBJECTS:.o=.d)

.PHONY: clean .mkbuild check all

clean:
	@rm -rf $(BUILD_DIR)

.mkbuild:
	@mkdir -p $(BUILD_DIR)
